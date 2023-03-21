<?php
namespace App\Nig\Model\Repository;

use App\Nig\Lib\Password;
use App\Nig\Model\DataObject\User;
use App\Nig\Model\HTTP\Session;

class UserRepository{
        public static function register(User $user){
            $sql="INSERT INTO Users VALUES (:loginUserTag,:emailTag,:passwordTag,:avatarUrlTag,:nameTag)";
            $values=array (
                "loginUserTag"=> $user->getLogin(),
                "emailTag"=>$user->getEmail(),
                "passwordTag"=>$user->getPassword(),
                "avatarUrlTag"=>$user->getAvatarUrl(),
                "nameTag"=>$user->getNameUser()
            );
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $pdoStatement->execute($values);
        }

        public static function rename(User $u, String $newName){
            $sql="UPDATE Users SET name=:newNameTag WHERE loginUser=:loginTag";
            $values= array (
                "newNameTag"=>$newName,
                "loginTag"=>$u->getLogin()
            );
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql)->execute($values);
            $u->setNameUser($newName);
        }

        public static function changeAvatar(User $u, String $newAvatar){
            $sql="UPDATE Users SET avatarUrl=:newAvatarTag WHERE loginUser=:loginTag ";
            $values= array (
                "newAvatarTag"=>$newAvatar,
                "loginTag"=>$u->getLogin()
            );
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql)->execute($values);
            $u->setAvatarUrl($newAvatar);
        }

        public static function logIn(String $login, String $password): ?User{
            $sql="SELECT * FROM User WHERE loginUser=:loginUserTag AND password=:passwordTag ";
            $values=array (
                "loginUserTag"=>$login,
                "passwordTag"=>$password
            );
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql)->execute($values);
            $data=$pdoStatement->fetch();
            return new User($data['loginUser'],$data['name'],$data['email'],$data['password'],$data['avatarUrl']);
        }

        public static function allUser(): array{
            $session=Session::getInstance();
            $sql="SELECT * FROM Users EXCEPT SELECT * FROM Users WHERE loginUser=:loginUserTag ORDER BY name";
            $value= array (
                "loginUserTag"=>$session->lire('login')
            );
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $pdoStatement->execute($value);
            $usersData=$pdoStatement->fetchAll();
            $users=[];
            foreach ($usersData as $user){
                $users[]=new User($user['loginUser'],$user['name'],$user['email'],$user['password'],$user['avatarUrl']);
            }
            return $users;
        }

        public static function isAdmin(string $login): bool {
            $sql="SElECT * FROM Administrators WHERE loginUser=:loginUserTag";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $values=array (
                "loginUserTag"=>$login
            );
            $pdoStatement->execute($values);
            $existing=$pdoStatement->rowCount();
            return $existing > 0;
        }

        public static function checkAvailability(string $login): bool{
            $sql="SElECT * FROM Users WHERE loginUser=:loginUserTag";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $values=array (
                "loginUserTag"=>$login
            );
            $pdoStatement->execute($values);
            $existing=$pdoStatement->rowCount();
            if($existing==0){
                return true;
            }else{
                return false;
            }
        }

        public static function isAutor($login): bool{
            $sql="SELECT * FROM Autors WHERE loginUser=:loginUserTag";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $value= array  (
                "loginUserTag"=>$login
            );
            $pdoStatement->execute($value);
            $autor=$pdoStatement->rowCount();
            return $autor == 1;
        }

        public static function getAvatar($login): string {
            $sql="SELECT avatarUrl FROM Users WHERE loginUser=:loginUserTag";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $value= array (
                "loginUserTag"=>$login
            );
            $pdoStatement->execute($value);
            $data=$pdoStatement->fetch();
            $avatar=$data['avatarUrl'];
            return $avatar;
        }


        public static function isCollaborator(string $login, int $idQuestion):bool{
            $sql="SELECT * FROM selected WHERE loginUser=:loginUserTag AND roleName='collaborator' AND idQuestion=:idQuestionTag";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $values= array (
                "loginUserTag"=>$login,
                "idQuestionTag"=>$idQuestion
            );
            $pdoStatement->execute($values);
            $ok = $pdoStatement->rowCount();
            if($ok==1){
                return true;
            }else{
                return false;
            }
        }

        public static function addVoter(string $login,$idQuestion){
            $sql="INSERT INTO selected VALUES(:loginUserTag,:idQuestionTag,:roleNameTag) ";
            $pdoStament=DatabaseConnection::getPdo()->prepare($sql);
            $values= array (
                "loginUserTag"=>$login,
                "idQuestionTag"=>$idQuestion,
                "roleNameTag"=>"voter"
            );
            $pdoStament->execute($values);
        }

        public static function addAutor(string $login, int $idQuestion){
            $sql="INSERT INTO selected VALUES(:loginUserTag,:idQuestionTag,:roleNameTag) ";
            $pdoStament=DatabaseConnection::getPdo()->prepare($sql);
            $values= array (
                "loginUserTag"=>$login,
                "idQuestionTag"=>$idQuestion,
                "roleNameTag"=>"autor"
            );
            $pdoStament->execute($values);
        }

        public static function getAllVotersByQuestionId(int $idQuestion): array{
            $sql="SELECT loginUser FROM selected WHERE idQuestion=:idQuestionTag AND roleName='voter'";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $value= array (
                "idQuestionTag"=>$idQuestion
            );
            $pdoStatement->execute($value);
            $data=$pdoStatement->fetchAll();
            $voters=[];
            foreach ($data as $voter){
                $voters[]=$voter['loginUser'];
            }
            return $voters;
        }

        public static function getAllCollaboratorsByQuestionId(int $idQuestion): array{
            $sql="SELECT loginUser FROM selected WHERE idQuestion=:idQuestionTag AND roleName='collaborator'";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $value= array (
                "idQuestionTag"=>$idQuestion
            );
            $pdoStatement->execute($value);
            $data=$pdoStatement->fetchAll();
            $collaborators=[];
            foreach ($data as $collaborator){
                $collaborators[]=$collaborator['loginUser'];
            }
            return $collaborators;
        }

        public static function setCollaborator(string $login, int $idQuestion){
            $sql="UPDATE selected SET roleName=:roleNameTag WHERE idQuestion=:idQuestionTag AND loginUser=:loginUserTag";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $values=array (
                "roleNameTag"=>"collaborator",
                "idQuestionTag"=>$idQuestion,
                "loginUserTag"=>$login
            );
            $pdoStatement->execute($values);
        }

        public static function getNameUser($login){
            $sql="SELECT name FROM Users WHERE loginUser=:loginUserTag";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $value= array (
                "loginUserTag"=>$login
            );
            $pdoStatement->execute($value);
            $data=$pdoStatement->fetch();
            return $data['name'];
        }

        public static function getMail($login){
            $sql="SELECT email FROM Users WHERE loginUser=:loginUserTag";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $value= array (
                "loginUserTag"=>$login
            );
            $pdoStatement->execute($value);
            $data=$pdoStatement->fetch();
            return $data['email'];
        }

        public static function getCoAutor($idAnswer){
            $sql="SELECT * FROM participate WHERE idAnswer=:idAnswerTag ";
            $value= array (
                "idAnswerTag"=>$idAnswer
            );
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $pdoStatement->execute($value);
            return $pdoStatement->fetchAll();
        }

        public static function hasCoAutor($idAnswer){
            $sql="SELECT * FROM participate WHERE idAnswer=:idAnswerTag";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $value = array (
                "idAnswerTag"=>$idAnswer
            );
            $pdoStatement->execute($value);
            $nb=$pdoStatement->rowCount();
            if($nb==0){
                return false;
            }else{
                return true;
            }
        }

        public static function canVote($login,$idQuestion): bool{
            $sql="SELECT * FROM selected WHERE loginUser=:loginUserTag AND idQuestion=:idQuestionTag";
            $values= array (
                "loginUserTag"=>$login,
                "idQuestionTag"=>$idQuestion
            );
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $pdoStatement->execute($values);
            $ok=$pdoStatement->rowCount();

            if($ok==1){
                return true;
            }else{
                return false;
            }
        }

        public static function allAutors(){
            $sql="SELECT * FROM Autors ORDER BY loginUser";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $pdoStatement->execute();
            $autorData=$pdoStatement->fetchAll();
            $autors=[];
            foreach ($autorData as $autor){
                $autors[]=new User($autor['loginUser'],null,null,null,null);
            }
            return $autors;
        }

        public static function alreadyAutor(String $login): bool {
            $sql="SELECT loginUser FROM Autors WHERE loginUser=:loginTag";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $value=array (
                "loginTag"=>$login
            );
            $pdoStatement->execute($value) or die;
            $verif=$pdoStatement->fetch();
            if(!$verif==false){
                if($verif[0]==$login){
                    return true;
                }else {
                    return false;
                }
            }else return false;
        }

        public static function authentificate(string $pwd): bool {
            $session = Session::getInstance();
            $sql="SELECT * FROM Users WHERE loginUser=:loginUserTag;";
            $values=array (
                "loginUserTag"=>$session->lire("login"),
            );
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $pdoStatement->execute($values);
            $data=$pdoStatement->fetch();
            return Password::verifier($pwd, $data['password']);
        }

        public static function resetVotersAndCollaboratorsByQuestionId(int $idQuestion){
            $sql="DELETE FROM selected WHERE idQuestion=:idQuestionTag AND (roleName='voter' OR roleName='collaborator')";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $value= array (
                "idQuestionTag"=>$idQuestion
            );
            $pdoStatement->execute($value);
        }
    }
?>
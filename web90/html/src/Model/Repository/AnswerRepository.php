<?php
namespace App\Nig\Model\Repository;

use App\Nig\Model\DataObject\Question as Question;
use App\Nig\Model\Repository\DatabaseConnection;
use App\Nig\Model\Repository\AbstractRepository;
use App\Nig\Model\DataObject\Section as Section;
use App\Nig\Model\DataObject\Answer as Answer;
use App\Nig\Model\DataObject\Vote as Vote;

    class AnswerRepository{

        public static function getAnswersForAQuestionByOneUser(int $idQuestion, string $loginUser){
            $sql="SELECT a.idAnswer,a.answerContent,a.idSection,a.loginUser FROM Answers a JOIN Sections s ON a.idSection=s.idSection JOIN Questions q ON s.idQuestion=q.idQuestion WHERE q.idQuestion=:idQuestionTag AND a.loginUser=:loginUserTag";
            $values=array (
                "idQuestionTag"=>$idQuestion,
                "loginUserTag"=> $loginUser
            );
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $pdoStatement->execute($values);
            $answers=$pdoStatement->fetchAll();
            $res = [];
            foreach ($answers as $answer){
                $res[]=new Answer($answer['idSection'],$answer['idAnswer'],$answer['answerContent'],$answer['loginUser']);
            }
            return $res;
        }




    public static function save(Answer $s) : bool {
        $sql= "INSERT INTO Answers (answerContent,idSection, loginUser) VALUES (:contentTag,:idQuestionTag, :loginUserTag)";
        $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
        $values= array (
            "contentTag"=>$s->getContent(),
            "idQuestionTag"=>$s->getIdSection(), //pour le moment pas de idQuestion enregistré
            "loginUserTag"=>$s->getAuthor()
        );
        return $pdoStatement->execute($values);
    }

    public static function getAnswersByQuestionId(int $idQuestion) : array {
        $sql="SELECT * FROM Answers a JOIN Sections s ON a.idSection = s.idSection WHERE idQuestion=:idQuestionTag";
        $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
        $values= array(
            "idQuestionTag"=> $idQuestion
        );
        $pdoStatement->execute($values);
        $resRequest = $pdoStatement->fetchAll();
        $res = [];
        foreach ($resRequest as $answer) {
            $res[] = Answer::createWithId($answer['idSection'], $answer['idAnswer'], $answer['answerContent'], $answer['loginUser']);
        }
        return $res;
    }

    public static function vote(int $idAnswer, string $loginUser, int $value) : bool {
        self::unvote($idAnswer, $loginUser);
        $sql="INSERT INTO voteFor (idAnswer,loginUser,vote) VALUES (:idAnswerTag,:loginUserTag,:voteTag)";
        $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
        $values= array(
            "idAnswerTag"=>$idAnswer,
            "loginUserTag"=>$loginUser,
            "voteTag"=>$value
        );
        return $pdoStatement->execute($values);
    }

    public static function unvote(int $idAnswer, string $loginUser) : bool {
        $sql="DELETE FROM voteFor WHERE idAnswer=:idAnswerTag AND loginUser=:loginUserTag";
        $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
        $values= array(
            "idAnswerTag"=>$idAnswer,
            "loginUserTag"=>$loginUser
        );
        return $pdoStatement->execute($values);
    }

    public static function getVote(int $idAnswer, string $loginUser) : ?int {
        $sql="SELECT * FROM voteFor WHERE idAnswer=:idAnswerTag AND loginUser=:loginUserTag";
        $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
        $values= array(
            "idAnswerTag"=>$idAnswer,
            "loginUserTag"=>$loginUser
        );
        $pdoStatement->execute($values);
        $resRequest = $pdoStatement->fetch();
        if ($resRequest == false) {
            return null;
        }
        return $resRequest['vote'];
    }

    public static function getAllVotes(int $idAnswer): ?int {
        $sql = "SELECT SUM(vote) FROM voteFor WHERE idAnswer=:idAnswerTag";
        $pdoStatement = DatabaseConnection::getPdo()->prepare($sql);
        $values = [
            "idAnswerTag" => $idAnswer
        ];
        $pdoStatement->execute($values);
        return $pdoStatement->fetchColumn();
    }
        
     public static function getAnswersByUser(string $loginUser) : array {
            $sql="SELECT * FROM Answers a JOIN Sections s ON a.idSection = s.idSection WHERE loginUser=:loginUserTag";
            $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
            $values = array(
                "loginUserTag"=> $loginUser
            );
            $pdoStatement->execute($values);
            $resRequest = $pdoStatement->fetchAll();
            $res = [];
            foreach ($resRequest as $answer) {
                $res[] = Answer::createWithId($answer['idSection'], $answer['idAnswer'], $answer['answerContent'], $answer['loginUser']);
            }
            return $res;
     }

     public static function deleteAnswerById(string $id) {
            $sql = "DELETE FROM Answers WHERE idAnswer=:idAnswerTag";
            $pdoStatement = DatabaseConnection::getPdo()->prepare($sql);
            $values = [
                "idAnswerTag" => $id
            ];
            $pdoStatement->execute($values);
     }
} 

<?php
namespace App\Nig\Model\Repository;

use App\Nig\Model\DataObject\Section;
use App\Nig\Model\DataObject\Question;
use App\Nig\Model\DataObject\Tag;

class TagRepository {
    
    public static function save(Tag $t) : int {

        $sqlVerif="SELECT * FROM Tags WHERE nameTag=:nameTagTag ";
        $pdoStatement=DatabaseConnection::getPdo()->prepare($sqlVerif);
        $values= array (
             "nameTagTag"=>\htmlspecialchars($t->getName())
        );
        $pdoStatement->execute($values);
        $existing=$pdoStatement->rowCount();

        if($existing==0){
            $createTag="INSERT INTO Tags (nameTag) VALUES (:nameTag)";
            $valueName= array (
                "nameTag" => $t->getName()
            );
            $pdoStatement=DatabaseConnection::getPdo()->prepare($createTag);
            $pdoStatement->execute($valueName);
            $idTag=DatabaseConnection::getPdo()->lastInsertId($createTag);
        }else{
            $searchTag="SELECT idTag FROM Tags WHERE nameTag=:nameTag2";
            $valueName= array (
                "nameTag2" => $t->getName()
            );
            $pdoStatement=DatabaseConnection::getPdo()->prepare($searchTag);
            $pdoStatement->execute($valueName);
            $tagExist=$pdoStatement->fetch();
            $idTag=$tagExist["idTag"];
        }
        $insert="INSERT INTO has_tag VALUES (:idQuestionTag,:idTag)";
        $values= array (
        "idQuestionTag"=> $t->getIdQuestion(),
        "idTag"=> $idTag
        );
        $pdoStatement=DatabaseConnection::getPdo()->prepare($insert);
        $pdoStatement->execute($values);
        return $idTag;
    }

    public static function getTagsByQuestionId(int $idQuestion) : array {
        $sql = "SELECT * FROM Tags WHERE idTag IN (SELECT idTag FROM has_tag WHERE idQuestion=:idQuestionTag)";
        $pdoStatement = DatabaseConnection::getPdo()->prepare($sql);
        $values = array(
            "idQuestionTag" => $idQuestion
        );
        $pdoStatement->execute($values);
        $tagsFetched = $pdoStatement->fetchAll();
        $res = [];
        foreach ($tagsFetched as $tag) {
            // append in array
            $res[] = new Tag($tag['idTag'], $tag['nameTag'], $idQuestion);
        }
        return $res;
    }

    public static function deleteAllTagsByQuestionId(int $idQuestion) : bool {
        $sql = "DELETE FROM has_tag WHERE idQuestion=:idQuestionTag";
        $pdoStatement = DatabaseConnection::getPdo()->prepare($sql);
        $values = array(
            "idQuestionTag" => $idQuestion
        );
        return $pdoStatement->execute($values);
    }
}

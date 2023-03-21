<?php
namespace App\Nig\Model\Repository;

use App\Nig\Model\DataObject\AbstractDataObject;
use App\Nig\Model\DataObject\Section;
use App\Nig\Model\DataObject\Question;

class SectionRepository extends AbstractRepository {
    protected function getNomsColonnes(): array {
        return ["idSection", "title", "content", "idQuestion"];
    }

    protected function getNomClePrimaire(): string {
        return "idSection";
    }

    protected function getNomTable(): string {
        return "Sections";
    }

    protected function construire(array $ut): Section {
        return new Section($ut["title"], $ut["content"], $ut["idQuestion"]);
    }

    public static function save(Section $s) : bool {
        $sql= "INSERT INTO Sections (title,content,idQuestion) VALUES (:titleTag,:contentTag,:idQuestionTag)";
        $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
        $values= array (
            "titleTag"=>$s->getTitle(),
            "contentTag"=>$s->getContent(),
            "idQuestionTag"=>$s->getIdQuestion() //pour le moment pas de idQuestion enregistré
        );
        return $pdoStatement->execute($values);
    }

    public static function getSectionById(int $idSection) : Section {
        $sql="SELECT * FROM Sections WHERE idSection=:idSectionTag";
        $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
        $values= array(
            "idSectionTag"=> $idSection
        );
        $pdoStatement->execute($values);
        $sectionFetched = $pdoStatement->fetch();
        return new Section($sectionFetched['idSection'], $sectionFetched['title'], $sectionFetched['content'], $sectionFetched['idQuestion']);
    }

    public static function getSectionsByQuestionId(int $idQuestion) : array {
        $sql="SELECT * FROM Sections WHERE idQuestion=:idQuestionTag";
        $pdoStatement=DatabaseConnection::getPdo()->prepare($sql);
        $values= array(
            "idQuestionTag"=> $idQuestion
        );
        $pdoStatement->execute($values);
        $resRequest = $pdoStatement->fetchAll();
        $res = [];
        foreach ($resRequest as $section) {
            $res[] = new Section($section['idSection'], $section['title'], $section['content'], $idQuestion);
        }
        return $res;
    }

    public static function deleteAllAnwserPerQuestion(Question $q): bool {
        $sql = "DELETE * FROM Sections WHERE idQuestion=:idQuestionTag";
        $pdoStatement = DatabaseConnection::getPdo()->prepare($sql);

        $values = array(
            "idQuestionTag" => $q->getIdQuestion()
        );

        return $pdoStatement->execute($values);
    }

    public static function hasUserAnswered(string $idUser, string $idSection): bool {
        $sql = "SELECT COUNT(*) FROM Answers WHERE idSection=:idSectionTag AND loginUser=:loginUserTag";
        $pdo = DatabaseConnection::getPdo()->prepare($sql);
        $values = array(
            "loginUserTag" => $idUser,
            "idSectionTag" => $idSection
        );
        $pdo->execute($values);
        $nb = $pdo->fetch();
        return $nb[0] == 1;
    }

    public static function deleteAllSectionsByQuestionId($idQuestion) : bool {
        $sql = "DELETE FROM Sections WHERE idQuestion=:idQuestionTag";
        $pdoStatement = DatabaseConnection::getPdo()->prepare($sql);
        $values = array(
            "idQuestionTag" => $idQuestion
        );
        return $pdoStatement->execute($values);
    }
}
?>
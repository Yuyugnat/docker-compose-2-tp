<?php
namespace App\Nig\Model\Repository;

use App\Nig\Model\DataObject\AbstractDataObject;

abstract class AbstractRepository {
    protected abstract function getNomTable(): string;
    protected abstract function construire(array $objetFormatTableau) : AbstractDataObject;
    protected abstract function getNomClePrimaire(): string;
    protected abstract function getNomsColonnes(): array;

    public function rawSqlQuery($sql, $values): bool | \PDOStatement {
        $pdoStatement = DatabaseConnection::getPdo()->prepare($sql);
        $pdoStatement->execute($values);
        return $pdoStatement;
    }

    public function executeSql($sql, $values) {

    }

    public function selectAll(): array {
        $pdo = DatabaseConnection::getPdo();
        $pdoStatement = $pdo->query("SELECT * FROM " . $this->getNomTable());

        $res = [];

        foreach($pdoStatement as $obj) {
            $res[] = $this->construire($obj);
        }

        return $res;
    }

    public function select(string $valeurClePrimaire): ?AbstractDataObject {
        $sql = "SELECT * from {$this->getNomTable()} WHERE {$this->getNomClePrimaire()}=:clePrimaireTag";

        $pdoStatement = DatabaseConnection::getPdo()->prepare($sql);

        $values = array(
            "clePrimaireTag" => $valeurClePrimaire,
        );

        $pdoStatement->execute($values);
        $obj = $pdoStatement->fetch();
        return $obj ? $this->construire($obj) : NULL;
    }

    public function delete($valeurClePrimaire) {
        $sql = "DELETE FROM {$this->getNomTable()} WHERE {$this->getNomClePrimaire()}=:clePrimaireTag";

        $pdoStatement = DatabaseConnection::getPdo()->prepare($sql);

        $values = [
            "clePrimaireTag" => $valeurClePrimaire
        ];

        $pdoStatement->execute($values);
    }

    public function mettreAJour(AbstractDataObject $object) {

    }
}
?>

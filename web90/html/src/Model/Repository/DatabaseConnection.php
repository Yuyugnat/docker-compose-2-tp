<?php
namespace App\Nig\Model\Repository;

use App\Nig\Config\Conf;
use PDO;

class DatabaseConnection {
    private static ?DatabaseConnection $instance = null;

    private $pdo;

    public static function getPdo(): PDO {
        return static::getInstance()->pdo;
    }

    private function __construct () {
        $database_name = Conf::getDatabase();
        $hostname = Conf::getHostname();
        $login = Conf::getLogin();
        $password = Conf::getPassword();

        $this->pdo = new PDO("pgsql:host=$hostname;dbname=$database_name;port=8181", $login, $password);

        $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

    private static function getInstance(): DatabaseConnection {
        if (is_null(static::$instance))
            static::$instance = new DatabaseConnection();
        return static::$instance;
    }
}
?>

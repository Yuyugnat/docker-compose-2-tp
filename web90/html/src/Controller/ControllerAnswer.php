<?php
    namespace App\Nig\Controller;
    use App\Nig\Lib\MessageFlash;
    use App\Nig\Lib\Password;
    use App\Nig\Model\DataObject\Answer;
    use App\Nig\Model\Repository\DatabaseConnection;
    use App\Nig\Model\Repository\AnswerRepository;
    use App\Nig\Model\Repository\QuestionRepository;
    use App\Nig\Model\HTTP\Session;
    use App\Nig\Model\Repository\SectionRepository;
    use App\Nig\Model\Repository\UserRepository;

    Class ControllerAnswer {
        public static function displayView(string $pathView, array $parameters = [])
        {
            extract($parameters); // Crée des variables à partir du tableau $parametres
            require __DIR__ . "/../$pathView"; // Charge la vue
        }

        public static function answer(): void
        {
            $section = SectionRepository::getSectionById($_GET["id"]);
            $question = QuestionRepository::getQuestionById($section->getIdQuestion());
            self::displayView("./view.php", [
                "pageTitle" => "répondre",
                "cheminVueBody" => "question/answer.php",
                "question" => $question,
                "section" => $section
            ]);
        }

        public static function answered(): void
        {
            $session = Session::getInstance();
            $answer = Answer::create($_POST["idSection"], $_POST["content"], $session->lire('login'));
            AnswerRepository::save($answer);
            MessageFlash::ajouter("success", "La réponse a été créée avec succès");
            header("Location: frontController.php?controller=question&action=detail&idQuestion=" . QuestionRepository::getIdWithidSection($_POST['idSection']));
        }

        public static function tryToAnswer() : void{
            if ($_POST["content"] == ""){
                MessageFlash::ajouter("danger", "La réponse n'a pas été créée car votre réponse est vide");
                header("Location: frontController.php?controller=answer&action=answer&idSection=" . $_POST['idSection']);
            }
            else {
                self::answered();
            }
        }

        public static function voted() : void {
            $answers = QuestionRepository::getAnswers(((int) $_POST["id-question"]));
            foreach ($answers as $answer) {
                if (isset($_POST["vote-value-" . $answer['idAnswer']]))
                    if ($_POST["vote-value-" . $answer['idAnswer']] != 0) {
                        AnswerRepository::vote($answer['idAnswer'], Session::getInstance()->lire('login'), $_POST["vote-value-" . $answer['idAnswer']]);
                    } else {
                        AnswerRepository::unvote($answer['idAnswer'], Session::getInstance()->lire('login'));
                    }
            }
            MessageFlash::ajouter("success", "Votre vote a bien été pris en compte !");
            header("Location: frontController.php?controller=question&action=detail&idQuestion=" . $_POST["id-question"]);
        }

        public static function delete(): void {
            AnswerRepository::deleteAnswerById($_GET['idAnswer']);
            MessageFlash::ajouter("success", "La réponse a été supprimmée !");

            header("Location: ./frontController.php?action=detail&controller=question&idQuestion={$_GET['idQuestion']}");
            exit();
        }
    }
?>
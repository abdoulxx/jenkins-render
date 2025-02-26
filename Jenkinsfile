pipeline {
    agent any

    triggers {
        cron('H */12 * * *') // Exécution toutes les 12 heures
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/abdoulxx/gestion_note.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'composer install'
            }
        }
        
        stage('Run Tests') {
            steps {
                sh 'python3 tests/selenium_tests.py'
                sh 'python3 tests/selenium_test_pack_or.py'
            }
        }
        stage('Run Security Scan') {
            steps {
                sh 'python3 tests/spider.py'
                sh 'python3 tests/active_scan.py'
            }
        }
    }
    post {
        always {
            echo "Pipeline terminé"
        }
        success {
            mail to: 'ton-email@gmail.com',
                 subject: "✅ Pipeline Jenkins - Succès",
                 body: "Tous les tests sont passés avec succès."
        }
        failure {
            mail to: 'aboulayesamb@gmail.com',
                 subject: "❌ Pipeline Jenkins - Échec",
                 body: "Des tests ont échoué, veuillez vérifier."
        }
    }
}

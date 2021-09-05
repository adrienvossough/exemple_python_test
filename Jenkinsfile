pipeline {
    // None : pas d'agent global pour cette pipeline
    // chaque stage doit définir son agent
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    // permet de télécharger l'image docker voulu
                    // le conteneur devient l'agent que Jenkins va démarrer pour le stage "Build"
                    // /!\ il faut installer le plugin docker dans Jenkins.
                    image 'python:3.9'
                }
            }
            steps {
                // Nous exécutons une commande shell pour compiler notre application
                // le code est traduit dans un fichier "byte code", placé dans le répertoire src
                sh 'python -m py_compile src/app.py'
                // Stash, permet de sauvegarder tous les fichiers (original et compilé) pour
                // un stage à venir.
                stash(name: 'compiled-results', includes: 'src/*.py*')
            }
        }
        stage('Test') {
            agent {
                docker {
                    // ce conteneur servira d'agent pour les tests
                    image 'qnib/pytest'
                }
            }
            steps {
                // nous exécutons les tests contenu dans app.py
                // le résultat des tests  est contenant dans un fichier XML au format "JUnit XML report"
                // les resultats sont sauvegardés dans "test-reports/results.xml"
                sh 'py.test --verbose --junit-xml test-reports/results.xml app.py'
            }
            post {
                // post : tâches à executer à la fin du stage "Test".
                always {
                    // always : toujours exécuté, quel que soit le résultat final du stage "Test"
                    // la commande affiche les résultats des tests dans l'interface Jenkins
                    junit 'test-reports/results.xml'
                }
            }
        }
        stage('Deliver') { // deliver : livraison et pas déploiement !
            agent any
            // environement : définit des variables pouvant être utilisées dans le stage 'Deliver'
            environment {
                VOLUME = '$(pwd)/src:/src'
                IMAGE = 'cdrx/pyinstaller-linux:python2'
            }
            steps {
                // ce step fabrique un sous répertoire portant le N° du build
                dir(path: env.BUILD_ID) {
                    unstash(name: 'compiled-results')
                    sh "docker run --rm -v ${VOLUME} ${IMAGE} 'pyinstaller -F add2vals.py'"
                }
            }
            post {
                success {
                    archiveArtifacts "${env.BUILD_ID}/src/dist/add2vals"
                    sh "docker run --rm -v ${VOLUME} ${IMAGE} 'rm -rf build dist'"
                }
            }
        }
    }
}
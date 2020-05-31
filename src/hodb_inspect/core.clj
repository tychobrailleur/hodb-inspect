(ns hodb-inspect.core
  (:require [clojure.tools.cli :refer [parse-opts]]
            [hodb-inspect.db :as db])
  (:gen-class))


(def cli-options
  [["-d" "--db DB" "Database location" :required true]
   ["-i" "--info"]
   ["-l" "--load"]
   ["-g" "--guess"]
   ["-h" "--help"]])

(defn print-info [path]
  (let [db-spec (db/create-db-spec path)
        conf (db/hodb-config db-spec)
        basics (db/hodb-basic db-spec)
        hrf-id (:hrf_id basics)
        league (db/hodb-league db-spec hrf-id)]
    (println)
    (println (str "Path: " (db/db-path path)))
    (println)
    (println (str "HO DB Version: " (get conf "DBVersion")))
    (println (str "Last Conf Update: " (get conf "LastConfUpdate")))
    (println)
    (println (str "Team: " (get basics :teamname) " [" (get basics :teamid) "]"))
    (println (str "Manager: " (get basics :manager) " (since " (get basics :activationdate) ")"))
    (println (str "Latest Season: " (get basics :saison)))
    (println (str "Country: " (get basics :land)))
    (println (str "Liga: " (get basics :liga) " ("
                  (get league :liganame)
                  ") Position: "
                  (get league :platz)))
    (println)))

(defn load-db [path]
  (let [db-spec (db/create-db-spec path)
        tables (map :table_name (db/hodb-tables db-spec))]
    (println tables)
    (doseq [table tables]
      (println (db/hodb-table-records db-spec table)))))

(defn guess-db
  "Attempts to guess the version of the database based on the schema."
  [path]
  (let [db-spec (db/create-db-spec path)
        tables (db/hodb-tables db-spec)]
    (println "TODO")))

(defn exit [status & msg]
  (when msg
    (println msg))
  (System/exit status))


(defn -main [& args]
  (let [{:keys [options _arguments _summary]} (parse-opts args cli-options)]
    (when-not (:db options)
      (println "`--db` must be specified")
      (exit 1))
    (cond
      (:info options) (print-info (:db options))
      (:load options) (load-db (:db options))
      (:guess options) (guess-db (:db options))
      :else (println "HO DB Inspect."))))

(ns hodb-inspect.db
  (:require [clojure.java.jdbc :as jdbc]
            [clojure.string :as str]
            [hodb-inspect.db :as db]))

(defn filter-key [values k]
  (let [{kk :config_key vv :config_value} (first (filter #(= (% :config_key) k) values))]
    (assoc {} kk vv)))

(defn db-path [path]
  (subs path 0 (str/last-index-of path ".")))


(defn create-db-spec [path]
  {:dbtype "hsqldb"
   :dbname (db-path path)
   :user "sa"
   :password ""})

(defn hodb-config [db-spec]
  (let [conf (jdbc/query db-spec ["SELECT CONFIG_KEY, CONFIG_VALUE FROM userconfiguration"])]
    (-> {}
        (merge (filter-key conf "DBVersion"))
        (merge (filter-key conf "LastConfUpdate")))))

(defn hodb-basic [db-spec]
  (let [basics (jdbc/query db-spec ["SELECT hrf_id, manager, teamid, teamname, land, liga, saison, activationdate FROM BASICS ORDER BY HRF_ID DESC LIMIT 1"])]
    (first basics)))

(defn hodb-league [db-spec hrf]
  (-> (jdbc/query db-spec ["SELECT LIGANAME, PLATZ, SPIELTAG from LIGA WHERE HRF_ID = ?" hrf])
      first))

(defn hodb-tables [db-spec]
  (jdbc/query db-spec ["SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'PUBLIC'"]))


(defn hodb-table-records [db-spec table-name]
  (jdbc/query db-spec [(format "SELECT * FROM %s" table-name)]))
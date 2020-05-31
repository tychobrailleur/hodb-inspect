(defproject hodb-inspect "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.10.1"]
                 [org.clojure/tools.cli "1.0.194"]
                 [org.clojure/java.jdbc "0.7.11"]
                 [org.hsqldb/hsqldb "2.5.0"]
                 [org.postgresql/postgresql "42.2.12"]]
  :repl-options {:init-ns hodb-inspect.core}
  :aot :all
  :jvm-opts ["-Xmx2g"]
  :main hodb-inspect.core)
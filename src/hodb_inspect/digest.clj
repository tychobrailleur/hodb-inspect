(ns hodb-inspect.digest
  (:import [org.apache.commons.codec.binary Hex]
           [java.security MessageDigest]
           [java.io File FileInputStream]))

(defn file->bytes [path]
  (let [f (File. path)
        fis (FileInputStream. f)
        bytes (byte-array (.length f))]
    (doto fis
      (.read bytes)
      .close)
    bytes))

(defn bytes->hex [bytes]
   (Hex/encodeHexString bytes))

(defn digest-data-file [path]
  (let [sha256-digest (MessageDigest/getInstance "SHA-256")]
    (->> path
         file->bytes
         (.digest sha256-digest)
         bytes->hex)))

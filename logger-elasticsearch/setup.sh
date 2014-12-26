/elasticsearch/bin/elasticsearch -d

until $(curl --output /dev/null --silent --head --fail http://localhost:9200); do
    printf '.'
    sleep 1
done

curl -XPUT 'localhost:9200/machinestats?pretty'
curl -XPUT 'localhost:9200/machinestats/_mapping/stats?pretty' -d '{  
  "properties" : {
    "@timestamp" : {
      "type" : "date",
      "format" : "dateOptionalTime"
    },
    "dstat" : {
      "properties" : {
        "dsk/total" : {
          "properties" : {
            "read" : {
              "type" : "long"
            },
            "writ" : {
              "type" : "long"
            }
          }
        },
        "memory usage" : {
          "properties" : {
            "buff" : {
              "type" : "integer"
            },
            "cach" : {
              "type" : "integer"
            },
            "free" : {
              "type" : "integer"
            },
            "used" : {
              "type" : "integer"
            }
          }
        },
        "net/total" : {
          "properties" : {
            "recv" : {
              "type" : "integer"
            },
            "send" : {
              "type" : "integer"
            }
          }
        },
        "total cpu usage" : {
          "properties" : {
            "hiq" : {
              "type" : "integer"
            },
            "idl" : {
              "type" : "integer"
            },
            "siq" : {
              "type" : "integer"
            },
            "sys" : {
              "type" : "integer"
            },
            "usr" : {
              "type" : "integer"
            },
            "wai" : {
              "type" : "integer"
            }
          }
        }
      }
    },
    "hostname" : {
      "type" : "string"
    }
  }
}'

sleep 30
# Load the Rails application.
require_relative 'application'
ENV['per_page']='30'
#ENV['FACEBOOK_APP_ID']="1070956589720890"
#ENV['FACEBBOK_APP_SECRET']="4e880b866b921c067d9f0838e50b548f"
ENV['FACEBOOK_APP_ID']="2050909461893269"
ENV['FACEBOOK_APP_SECRET']="b864874aa3ebd95aba8024d1153a7572"
ENV["GOOGLE_CLIENT_ID"]="594909260794-0h3auanun7gi6igvu7646nb8stv2t4hm.apps.googleusercontent.com" 
ENV["GOOGLE_CLIENT_SECRET"]="rNEjKnDzSQ-Py3TfUZvJ7b6K"
# ENV["GOOGLE_CLIENT_ID"] = "691815144799-je0m66k9c6enar9l986ms04phbft5e10.apps.googleusercontent.com"
# ENV["GOOGLE_CLIENT_SECRET"] = "ELxgyVOD8wDq5-eXDEglALfN"
ENV["TWITTER_API_KEY"]= "nEfe27C3l8zIEovBQsyBpw67O"
ENV["TWITTER_API_SECRET"] = "4KOIPSxUgj5aC5eVVWT3Y2nAGEUwWO074MG4Q4zfaOr2AyYaTB"
ENV['schedular_ip'] = 'http://172.16.0.161:80/scheduler'
ENV['storage_ip'] = 'http://172.16.0.99:80/eol/archiver'
ENV['SCHEDULER_IP'] = "172.16.0.161"
ENV['SCHEDULER_PORT'] = "80"
ENV['logo_ip'] = "http://172.16.0.99"
#require 'ntlm/smtp'
# Initialize the Rails application.
Rails.application.initialize!

DYNAMIC_HIERARCHY_RESOURCE_ID = 1
HBASE_ADDRESS = "http://172.16.0.99/hbase/api/"
HBASE_GET_LATEST_UPDATES_ACTION = "getLatestUpdates"
HBASE_GET_NODES_OF_RESOURCE_ACTION = "getLatestNodesOfResource"
MYSQL_ADDRESS = "http://172.16.0.99/mysql/"
# MYSQL_ADDRESS = "http://localhost:8020/mysql/"
MYSQL_GET_LATEST_UPDATES_ACTION = "getLatestUpdates"
MYSQL_GET_START_AND_END_TIMES = "getStartAndEndTimes"
STORAGE_LAYER_IP= "172.16.0.99"
NEO4J_ADDRESS = "172.16.0.161:80/eol/neo4j"
MYSQL_GET_END_TIME = "getEndTime"
NEO4J_GET_PARENTS_OF_NODES_ACTION = "getParentsOfNodes"
NEO4J_GET_ANCESTORS_OF_NODES_ACTION = "getAncestors"
SCHEDULER_ADDRESS = "172.16.0.161:80/scheduler"
CHECK_FOR_UPDATES = "readyResources"
MYSQL_GET_END_TIME = "getEndTime"
NEO4J_IMPORT_PATH = "/home/a-amorad/neo4j-community-3.4.1/import/"
# NEO4J_IMPORT_PATH = "/home/ba/neo4j-community-3.4.0-alpha03/import/"

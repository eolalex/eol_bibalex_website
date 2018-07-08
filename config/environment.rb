# Load the Rails application.
require_relative 'application'
ENV['per_page']='30'
ENV['FACEBOOK_APP_ID']="2050909461893269"
ENV['FACEBBOK_APP_SECRET']="95af43f7d5eb0efb70138d225b2965d2"
ENV["GOOGLE_CLIENT_ID"]="594909260794-0h3auanun7gi6igvu7646nb8stv2t4hm.apps.googleusercontent.com"
ENV["GOOGLE_CLIENT_SECRET"] = "IzX97jLNyqEapO5k3dttIWhE"
ENV["TWITTER_API_KEY"]= "nEfe27C3l8zIEovBQsyBpw67O"
ENV["TWITTER_API_SECRET"] = "4KOIPSxUgj5aC5eVVWT3Y2nAGEUwWO074MG4Q4zfaOr2AyYaTB"
# Initialize the Rails application.
Rails.application.initialize!

DYNAMIC_HIERARCHY_RESOURCE_ID = 1
HBASE_ADDRESS = "http://172.16.0.99/hbase/api/"
HBASE_GET_LATEST_UPDATES_ACTION = "getLatestUpdates"
STORAGE_LAYER_IP= "172.16.0.99"
NEO4J_ADDRESS = "172.16.0.161:80/eol/neo4j"
NEO4J_GET_PARENTS_OF_NODES_ACTION = "getParentsOfNodes"
SCHEDULER_ADDRESS = "172.16.0.161:80/scheduler"
CHECK_FOR_UPDATES = "readyResources"

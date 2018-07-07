# Load the Rails application.
require_relative 'application'
ENV['per_page']='30'

# Initialize the Rails application.
Rails.application.initialize!

DYNAMIC_HIERARCHY_RESOURCE_ID = 1
HBASE_ADDRESS = "http://172.16.0.99/hbase/api/"
HBASE_GET_LATEST_UPDATES_ACTION = "getLatestUpdates"
STORAGE_LAYER_IP= "172.16.0.99"
NEO4J_ADDRESS = "172.16.0.161:80/eol/neo4j"
NEO4J_GET_PARENTS_OF_NODES_ACTION = "getParentsOfNodes"
NEO4J_GET_ANCESTORS_OF_NODES_ACTION = "getAncestors"
SCHEDULER_ADDRESS = "172.16.0.161:80/scheduler"
CHECK_FOR_UPDATES = "readyResources"

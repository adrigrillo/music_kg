# Command to generate the areas graph
docker run -it --rm --network="host" -v ~/Documents/knowledge_graphs/project/graph/:/data r2rml /data/config.properties

# Command to generate the genre graph
java -jar ~/Apps/rmlmapper.jar -m ~/Documents/knowledge_graphs/project/graph/genres-mapping.ttl -o ~/Documents/knowledge_graphs/project/graph/output/genres-graph-part.nt -s nquads -v && gzip -f -v ~/Documents/knowledge_graphs/project/graph/output/genres-graph-part.nt

# Running limes
cd ~/Documents/knowledge_graphs/project/graph/limes && java -jar ~/Apps/LIMES/limes-core-1.5.6.jar ./groups_dbpedia-config.xml
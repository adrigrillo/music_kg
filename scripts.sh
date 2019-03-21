# Command to generate the areas graph
docker run -it --rm --network="host" -v ~/Documents/knowledge_graphs/project/graph/:/data r2rml /data/config.properties

# Command to generate the genre graph
java -jar ~/Apps/rmlmapper.jar -m ~/Documents/knowledge_graphs/project/graph/genres-mapping.ttl -o ~/Documents/knowledge_graphs/project/graph/genres-graph-part.ttl -s turtle -v && gzip -f ~/Documents/knowledge_graphs/project/graph/genres-graph-part.ttl
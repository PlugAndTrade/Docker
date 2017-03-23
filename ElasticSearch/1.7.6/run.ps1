param (
	[string]$imageName = $(Read-Host "Image name"),
	[string]$clusterName = $(Read-Host "Cluster name"),
	[string]$nodeName = $(Read-Host "Node name")
)

docker run -d -p 9200:9200 -p 9300:9300 $imageName elasticsearch `
	--cluster.name "$clusterName" `
	--node.name "$nodeName" `
	--script.disable_dynamic false `
	--network.publish_host "127.0.0.1" `
	--http.compression true
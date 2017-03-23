param (
	[string]$imageName = $(Read-Host "Image name")
)

docker run -d -p 5671-5672:5671-5672 -p 15672:15672 $imageName
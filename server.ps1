$port = 8000
$webroot = (Get-Location).Path

$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "Server listening at http://localhost:$port" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow

try {
    while ($true) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $path = $request.Url.LocalPath
        if ($path -eq "/") { $path = "/index.html" }
        
        $filePath = Join-Path $webroot $path.TrimStart("/")
        
        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath)
            $mimeTypes = @{
                '.html' = 'text/html'
                '.js'   = 'application/javascript'
                '.css'  = 'text/css'
                '.svg'  = 'image/svg+xml'
                '.json' = 'application/json'
            }
            $contentType = if ($mimeTypes[$ext]) { $mimeTypes[$ext] } else { 'text/plain' }
            
            $content = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentType = $contentType
            $response.ContentLength64 = $content.Length
            $response.OutputStream.Write($content, 0, $content.Length)
            Write-Host "200 $path" -ForegroundColor Green
        } else {
            $response.StatusCode = 404
            $response.StatusDescription = "Not Found"
            Write-Host "404 $path" -ForegroundColor Red
        }
        $response.Close()
    }
} finally {
    $listener.Close()
}

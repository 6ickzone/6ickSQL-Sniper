<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>

<h1>6ickSQL Sniper</h1>
<p><strong>Versatile Google Dork & SQLi Recon Tool</strong><br />
by <strong>0x6ick</strong></p>

<hr />

<h2>Versions</h2>
<ul>
  <li><strong>LITE v6</strong>:  
  Safe public version. Scrapes URLs from Google Dork and checks HTTP status only, no injection.<br />
  File: <code>6qlLite.sh</code></li>
  <li><strong>ULTIMATE v6</strong>:  
  Advanced version with auto injection and vulnerability checks.<br />
  File: <code>v6/6ql.sh</code></li>
</ul>

<h2>Features</h2>
<ul>
  <li>Google Dork scraping (manual input or from file)</li>
  <li>HTTP status checking (200, 500, etc)</li>
  <li>Detects error-based SQLi targets (Ultimate version only)</li>
  <li>Outputs saved to:
    <ul>
      <li><code>hasil.txt</code></li>
      <li><code>suspect.txt</code></li>
      <li><code>vuln.txt</code> (Ultimate only)</li>
    </ul>
  </li>
</ul>

<h2>Repository Structure</h2>
<ul>
  <li>
    <ul>
      <li><code>6qlLite.sh</code> - Lite safe version script</li>
      <li><code>v6/</code> - Folder containing ultimate v6 version
        <ul>
          <li><code>6ql.sh</code> - Ultimate advanced script</li>
        </ul>
      </li>
      <li><code>README.md</code> - This file</li>
    </ul>
  </li>
</ul>

<h2>How to Use (Termux/Linux)</h2>
<pre><code>git clone https://github.com/6ickzone/6ickSQL-Sniper.git
cd 6ickSQL-Sniper
chmod +x 6qlLite.sh
bash 6qlLite.sh

# For Ultimate:
cd v6
chmod +x 6ql.sh
bash 6ql.sh
</code></pre>

<h2>Dependencies</h2>
<ul>
  <li><code>curl</code></li>
  <li><code>grep</code></li>
  <li><code>sed</code></li>
  <li><code>figlet</code> (optional, for cool banners)</li>
  <li><code>lolcat</code> (optional, for colored output)</li>
</ul>

<h2>Credits</h2>
<p>Made with passion by <strong>0x6ick</strong><br />
Contact: <a href="mailto:6ickwhispers@gmail.com">6ickwhispers@gmail.com</a><br />
Blog: <a href="https://0x6sec.blogspot.com" target="_blank" rel="noopener noreferrer">0x6sec</a></p>

<h2>Roadmap</h2>
<ul>
  <li>✔️ v6 Lite</li>
  <li>✔️ v6 Ultimate</li>
  <li>🔜 v7: SQLMap Auto Mode, Proxy Rotation, Telegram Alerts</li>
</ul>

</body>
</html>

# Create folders
$dirs = @(
  "app",
  "app\auth\callback",
  "app\api\vin",
  "app\api\stripe\checkout",
  "app\api\stripe\portal",
  "app\api\stripe\webhook",
  "app\(public)\pricing",
  "app\(public)\lookup",
  "app\(app)\account",
  "app\(app)\v\guest",
  "components",
  "lib\supabase",
  "lib"
)

foreach ($d in $dirs) {
  New-Item -ItemType Directory -Force -Path $d | Out-Null
}

# package.json
@'
{
  "name": "mccollister-auto-solutions",
  "private": true,
  "version": "0.1.0",
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start"
  },
  "dependencies": {
    "@supabase/supabase-js": "^2.49.1",
    "@supabase/ssr": "^0.5.2",
    "next": "15.0.4",
    "react": "19.0.0",
    "react-dom": "19.0.0",
    "stripe": "^17.5.0"
  }
}
'@ | Set-Content package.json

# env example
@'
NEXT_PUBLIC_SITE_URL=http://localhost:3000
NEXT_PUBLIC_SUPABASE_URL=YOUR_SUPABASE_URL
NEXT_PUBLIC_SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
SUPABASE_SERVICE_ROLE_KEY=YOUR_SERVICE_ROLE_KEY
STRIPE_SECRET_KEY=sk_test_xxx
STRIPE_WEBHOOK_SECRET=whsec_xxx
'@ | Set-Content .env.example

# README
@'
McCollister Auto Solutions
Light-duty automotive parts, labor times, and repair platform.
'@ | Set-Content README.md

Write-Host "✅ Base project structure created"

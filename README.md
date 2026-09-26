# FitGuide

A SwiftUI fitness app: pick a goal, get guided gym/home workouts, and follow full meal plans with recipes. All data is stored on-device using SwiftData — no backend, no account needed.

## What's included

- `project.yml` — [XcodeGen](https://github.com/yonaskolb/XcodeGen) spec. This generates a real `.xcodeproj` on demand, so you don't need Xcode installed locally just to have a project file.
- `App/`, `Models/`, `Views/`, `Data/` — the actual SwiftUI source code.
- `.github/workflows/build-ipa.yml` — a GitHub Actions pipeline that:
  1. Spins up a free macOS runner
  2. Installs XcodeGen and generates the Xcode project
  3. Builds the app **unsigned** for a generic iOS device
  4. Packages it into `FitGuide-unsigned.ipa`
  5. Uploads it as a downloadable build artifact

## How to get your `.ipa`

1. **Create a new GitHub repo** and push this whole folder to it:
   ```bash
   git init
   git add .
   git commit -m "Initial FitGuide app"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/FitGuide.git
   git push -u origin main
   ```
2. Go to your repo on GitHub → the **Actions** tab. The workflow runs automatically on push (or click "Run workflow" to trigger it manually).
3. Wait for the build to finish (a few minutes).
4. Open the finished run → scroll to **Artifacts** → download `FitGuide-unsigned-ipa`. Unzip it to get `FitGuide-unsigned.ipa`.
5. Take that `.ipa` into gbox (or whatever signing tool you're using) and sign it with your own certificate/provisioning profile, then install it as usual.

## Notes

- The IPA from this pipeline is **unsigned** — that's expected. GitHub's runners don't have your Apple certificates, so signing has to happen on your end, which is exactly what gbox is for.
- Requires iOS 17+ on your phone (uses SwiftData, introduced in iOS 17).
- To add more workouts or recipes, edit `Data/SampleData.swift` — just add more `Workout(...)` or `Recipe(...)` entries following the existing pattern.
- To change the bundle identifier (e.g. if `com.fitguide.app` collides with something), edit `PRODUCT_BUNDLE_IDENTIFIER` in `project.yml`.

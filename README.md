## 🚀 Getting Started

1. **Install dependencies**

   Run the following command to install the required dependencies:

   ```bash
   npm install
   ```

   You should see output similar to this:

   ```
   added 50 packages, and audited 50 packages in 2s
   found 0 vulnerabilities
   ```

2. **Verify Node.js and npm versions**

   Ensure you have the correct versions of Node.js and npm installed by running:

   ```bash
   node -v
   npm -v
   ```

   You should see something like this:

   ```
   v16.20.0
   8.19.2
   ```

   If your versions are lower than the required versions (Node.js 16 or higher, npm 8 or higher), update them before proceeding.

3. **Run the tests**

   Run the following command to execute the Gherkin scenarios:

   ```bash
   npm test
   ```

   This will run the scenarios using Cucumber.js and generate an HTML report if configured. You should see something like this at the end of the console output:

   ```
   3 scenarios (3 passed)
   9 steps (9 passed)
   0m00.016s (executing steps: 0m00.001s)
   ```

An HTML report will also be generated at [`cucumber-report.html`](cucumber-report.html) in the project directory. Open this file in a browser to view the test results.

## 🧪 Try These Tasks

- Add a new scenario to search by **Party ID**
- Add a scenario where **no results are found**
- Proceed with writing the other scenarios in the workbook.

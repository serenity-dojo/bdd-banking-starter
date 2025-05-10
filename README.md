# BDD Banking Starter

## 🛠 Getting Started

Follow the steps below to get the project running locally and start writing your own scenarios.

### 🚀 Cloning the Project

```bash
git clone https://github.com/serenity-dojo/bdd-banking-starter
cd bdd-banking-starter
```

### 💻 Open in VS Code

```bash
code .
```

### 📦 Install dependencies

```bash
npm install
```

### 🧪 Run the Tests

```bash
npm run test
```

The report will be generated as `cucumber-report.html`.

---

## ✍️ Add Scenarios for "Add a New Real-Time Payee Using PayID"

This project includes Gherkin scenarios for managing PayID notifications. Now, your task is to implement a new set of scenarios related to adding a new real-time payee using a mobile number, email, ABN, or organisation ID.

Open the feature file at:

```bash
features/add-new-payee.feature
```

In this file, add Gherkin scenarios for the following examples:

- The one where Nick enters a valid PayID using a mobile number
- The one where Oscar enters a valid organisation identifier
- The one where Lucia enters an incorrect mobile number ⇒ "please enter a valid Australian mobile number"
- The one where Josh enters a US number ⇒ "please enter a valid Australian mobile number"
- The one where Denise enters the email of a registered PayID user ⇒ The payee name is shown
- The one where the email is not registered ⇒ "no matching payee"
- The one where Sam enters a PayID already saved ⇒ "This payee already exists in your address book"

Use concrete data and expressive, business-readable Gherkin syntax.

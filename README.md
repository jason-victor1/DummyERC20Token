# Dummy ERC-20 Token

This repository contains a simple ERC-20 token implementation for practicing smart contract auditing and mastering GitHub and Git workflows.

---

## Files

1. **Token.sol**: The ERC-20 token smart contract source code.
2. **Audit_Report.md**: A detailed audit report documenting findings, fixes, and gas optimizations.
3. **README.md**: Project overview, instructions, and a step-by-step guide for the auditing process.

---

## How to Use

### **Step 1: Clone the Repository**
Clone the repository to your local machine:
```bash
git clone https://github.com/your-username/DummyERC20Token.git
cd DummyERC20Token
```

---

### **Step 2: Analyze the Smart Contract**
Analyze the `Token.sol` file for vulnerabilities:
1. Review the code manually for logical errors, security risks, and optimization opportunities.
2. Use automated tools like **Slither** for additional insights:
   ```bash
   slither Token.sol
   ```

---

### **Step 3: Document Issues**
1. Use GitHub Issues to document findings:
   - Categorize issues as **Critical**, **Medium**, **Low**, or **Gas Optimization** using labels. 
   - Provide a detailed description, impact, and potential fix for each issue.

2. Example Issue:
   - **Title:** "Critical: Missing Access Control on Mint Function"
   - **Description:** The `mint` function lacks an `onlyOwner` modifier, allowing anyone to mint tokens.

---

### **Step 4: Propose Fixes**
1. Create a new branch for fixes:
   ```bash
   git checkout -b audit-findings
   ```

2. Implement fixes in `Token.sol` and test locally:
   - Add access control (`onlyOwner` modifier) to the `mint` function.
   - Emit required events for state changes (e.g., `Transfer` and `Mint`).
   - Optimize gas usage by minimizing redundant storage reads.

3. Commit and push fixes:
   ```bash
   git add Token.sol
   git commit -m "Fix: Add onlyOwner modifier and optimize gas usage"
   git push origin audit-findings
   ```

---

### **Step 5: Automate Security Checks**
Set up GitHub Actions to run automated security analysis:
1. Create a workflow file: `.github/workflows/security.yml`.
2. Include steps to:
   - Install `solc` (matching your Solidity version).
   - Install and run **Slither**.

3. Example Workflow Snippet:
   ```yaml
   - name: Run Slither Analysis
     run: |
       slither .
   ```

---

### **Step 6: Write the Audit Report**
1. Create `Audit_Report.md` and document:
   - Findings categorized by severity.
   - Resolutions and optimizations applied.

2. Example Report Snippet:
   ```markdown
   ### Critical Issues
   - **Issue:** Missing Access Control on `mint` Function
     - **Impact:** Unauthorized minting of tokens.
     - **Resolution:** Added `onlyOwner` modifier.

   ### Gas Optimization Suggestions
   - Use `unchecked` for arithmetic operations where overflow is not a concern.
   ```

3. Commit and push the report:
   ```bash
   git add Audit_Report.md
   git commit -m "Add audit report"
   git push origin audit-findings
   ```

---

### **Step 7: Merge Changes**
1. Open a pull request on GitHub to merge the `audit-findings` branch into `main`.
2. Add a title and description summarizing the fixes and updates.
3. Merge the branch after approval.

---

### **Step 8: Reflect**
Document the process, issues, and solutions in this `README.md` for future practice.

---

## Issues Encountered and Solutions

1. **Issue:** "solc" Version Mismatch
   - **Cause:** Incorrect Solidity compiler version during Slither analysis.
   - **Solution:** Used `solc-select` to install and set the correct version:
     ```bash
     solc-select install 0.8.28
     solc-select use 0.8.28
     ```

2. **Issue:** Merge Conflict
   - **Cause:** Simultaneous changes in `main` and `audit-findings` branches.
   - **Solution:** Resolved the conflict locally and completed the merge.

3. **Issue:** GitHub Actions Workflow Failing
   - **Cause:** Incorrect installation steps for `solc` in `security.yml`.
   - **Solution:** Updated the workflow to use `solc-select`.

4. **Issue:** Stuck in `vim` During Merge
   - **Cause:** Default Git editor is `vim`.
   - **Solution:** Learned `vim` commands to save and exit:
     ```vim
     :wq
     ```

---

## Conclusion

This repository and guide provide a structured approach to smart contract auditing, emphasizing best practices in security, optimization, and Git/GitHub workflows. Repeat this process to build mastery and confidence in auditing Solidity contracts.




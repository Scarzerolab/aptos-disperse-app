<pre align="center">
███╗   ███╗ ██╗   ██╗ ██╗    ███████████╗  ██████╗  ███████╗
████╗ ████║ ██║   ██║ ██║     ╚══██╔════╝ ██╔═══██╗ ██╔════╝
██╔████╔██║ ██║   ██║ ██║        ██║      ██║   ██║ ███████
██║╚██╔╝██║ ██║   ██║ ██║        ██║      ██║   ██║ ╔══╝███
██║ ╚═╝ ██║ ╚██████╔╝ ███████╗   ██║      ╚██████╔╝ ███████╗
╚═╝     ╚═╝  ╚═════╝  ╚══════╝   ╚═╝       ╚═════╝  ╚══════╝
</pre>

this is a smart contract for multos, An Aptos-based application that can send a single token to multiple address in one transaction.

## 🚀 Function

this smart contract consist of 2 function:

### 1. disperseAptos:
This public entry function allows you to send Aptos Coins to a list of recipients.
- parameters:
    - `sender: &signer`: The account executing the transaction and providing the funds
    - `to: vector<address>`: A vector of recipient addresses
    - `values: vector<u64>`: A vector of u64 values representing the amount of APT to send to each corresponding recipient.

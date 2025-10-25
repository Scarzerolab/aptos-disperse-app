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
- Behaviors:
    - It checks that the `to` and `values` vectors have the same length and are not empty
    - It iterates through the lists, transferring the specified amount of APT to each recipient.
    - Transfer of `0` APT are skipped

### 2. disperseCustomToken:
This public entry function allows you to send a custom fungible token to a list of recipients.

- parameters:
    - `sender: &signer`: The account executing the transaction and providing the funds.
    - `asset_metadata: Object<Metadata>`: he object reference for the custom fungible token. This is used to identify the specific token to be dispersed.

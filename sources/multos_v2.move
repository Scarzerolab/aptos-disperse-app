module admin_addr::MULTOS_V2 {
    use 0x1::coin::transfer;
    use 0x1::aptos_coin::AptosCoin;
    //use std::vector;
    //use std::signer;

    public entry fun disperseAptos(
        sender: &signer, to: vector<address>, values: vector<u64>
    ) {
        let to_lenght: u64 = to.length();
        let amount_lenght: u64 = values.length();

        assert!(to_lenght == amount_lenght, 42);
        assert!(to_lenght > 0, 42);

        let i: u64 = 0;
        while (i < to_lenght) {
            let recipient: address = to[i];
            let amount: u64 = values[i];

            if (amount > 0) {
                transfer<AptosCoin>(sender, recipient, amount);
            };

            i += 1;
        }
    }

    public entry fun disperseCustomToken<CoinType>(
        sender: &signer, to: vector<address>, values: vector<u64>
    ) {
        let to_lenght: u64 = to.length();
        let amount_lenght: u64 = values.length();

        assert!(to_lenght == amount_lenght, 42);
        assert!(to_lenght > 0, 42);

        let i: u64 = 0;
        while (i < to_lenght) {
            let recipinet: address = to[i];
            let amount: u64 = values[i];

            if (amount > 0) {
                transfer<CoinType>(sender, recipinet, amount);
            };

            i += 1;
        }
    }
}

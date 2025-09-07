module admin_addr::MULTOS{
    use 0x1::coin::transfer;
    use 0x1::aptos_coin::AptosCoin;
    //use std::vector;
    //use std::signer;

    public fun disperseAptos(to: vector<address>, values: vector<u64>, sender: &signer){
        let to_lenght: u64 = to.length();
        let amount_lenght: u64 = values.length();

        assert!(to_lenght == amount_lenght, 42);
        assert!(to_lenght > 0, 42);

        let i: u64 = 0;
        while (i < to_lenght){
            let recipient: address = to[i];
            let amount: u64 = values[i];

            if (amount > 0) {
                transfer<AptosCoin>(sender, recipient, amount);
            };

            i += 1;
        }
    }

    public fun disperseCustomToken<CoinType>(sender: &signer, to: vector<address>, values: vector<u64>){
        let to_lenght: u64 = to.length();
        let amount_lenght: u64 = values.length();

        assert!(to_lenght == amount_lenght, 42);
        assert!(to_lenght > 0, 42);

        let i: u64 = 0;
        while (i < to_lenght){
            let recipinet: address = to[i];
            let amount: u64 = values[i];

            if (amount > 0) {
                transfer(sender, recipinet, amount);
            };

            i += 1;
        }
    }
}
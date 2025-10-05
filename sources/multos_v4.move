module admin_addr::MULTOS_V4 {
    use 0x1::aptos_coin::AptosCoin;
    use 0x1::coin::transfer;
    use 0x1::primary_fungible_store;
    use 0x1::object::Object;
    use 0x1::fungible_asset::Metadata;
    use std::signer;

    const FEE_PERCENTAGE: u64 = 1; //1%
    const FEE_DENOMINATOR: u64 = 100;

    //error handling
    const NOT_AUTHORIZED: u64 = 1;
    const INVALID_LENGHT: u64 = 42;

    struct FeeConfig has key {
        collector: address,
    }

    fun init_module(deployer: &signer) {
        move_to(deployer, FeeConfig {
            collector: signer::address_of(deployer),
        })
    }

    public entry fun set_fee_collector(
        current_collector: &signer,
        new_collector: address
    ) acquires FeeConfig {
        let config = borrow_global_mut<FeeConfig>(@admin_addr);
        assert!(signer::address_of(current_collector) == config.collector, NOT_AUTHORIZED);
        config.collector = new_collector
    }

    #[view]
    public fun get_fee_collector(): address acquires FeeConfig {
        borrow_global<FeeConfig>(@admin_addr).collector
    }

    public entry fun disperseAptos(
        sender: &signer, to: vector<address>, values: vector<u64>
    ) acquires FeeConfig {
        let to_lenght: u64 = to.length();
        let amount_lenght: u64 = values.length();

        assert!(to_lenght == amount_lenght, INVALID_LENGHT);
        assert!(to_lenght > 0, INVALID_LENGHT);

        let fee_collector = borrow_global<FeeConfig>(@admin_addr).collector;

        let i: u64 = 0;
        while (i < to_lenght) {
            let recipient: address = to[i];
            let amount: u64 = values[i];

            if (amount > 0) {
                let fee: u64 = (amount * FEE_PERCENTAGE) / FEE_DENOMINATOR;
                transfer<AptosCoin>(sender, recipient, amount);
                if (fee > 0) {
                    transfer<AptosCoin>(sender, fee_collector, fee)
                }
            };
            i += 1;
        }
    }

    public entry fun disperseCustomToken(
        sender: &signer, asset_metadata: Object<Metadata>, to: vector<address>, values: vector<u64>
    ) acquires FeeConfig {
        let to_lenght: u64 = to.length();
        let amount_lenght: u64 = values.length();

        assert!(to_lenght == amount_lenght, INVALID_LENGHT);
        assert!(to_lenght > 0, INVALID_LENGHT);

        let fee_collector = borrow_global<FeeConfig>(@admin_addr).collector;

        let i: u64 = 0;
        while (i < to_lenght) {
            let recipient: address = to[i];
            let amount: u64 = values[i];

            if(amount > 0) {
                let fee: u64 = (amount * FEE_PERCENTAGE) / FEE_DENOMINATOR;
                primary_fungible_store::transfer(sender, asset_metadata, recipient, amount);
                if (fee > 0) {
                    primary_fungible_store::transfer(sender, asset_metadata, fee_collector, fee);
                }
            };
            i += 1;
        }
    }
}
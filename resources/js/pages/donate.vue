<template>
    <wrapper>
    <div>
            <p>
                To help us continue our mission in providing you with the best and verified online businesses on the internet, we need your help to accomplish this goal.
            </p>
            <p class="font-weight-bold">
                Donate using either of these cryptocurrencies
            </p>
                    <v-snackbar
                    v-model="show"
                    timeout="1000"
                    color="success"
                    >
                    Copied
                    </v-snackbar>

            <v-card-text>
                <v-card class="my-2">
                    <v-card-title>
                        Bitcoin <v-icon color="yellow darken-2">mdi-bitcoin</v-icon>
                    </v-card-title>
                    <v-card-subtitle>
                        <v-text-field
                            filled
                            readonly
                            dense
                            value="1MZKd2mBy46HAc7yhhpie31by1oAUB3HNu"
                            type="text"
                            append-icon="mdi-content-copy"
                            @click:append="copy('1MZKd2mBy46HAc7yhhpie31by1oAUB3HNu')"
                        >
                        </v-text-field>
                    </v-card-subtitle>
                </v-card>
                <v-card class="my-2">
                    <v-card-title>
                        Ethereum <v-icon light >mdi-ethereum</v-icon>
                    </v-card-title>
                    <v-card-subtitle>
          <v-text-field
            filled
            readonly
            dense
            value="0x1c4b2e0d25f2291fae15c8b2069ea7c20ab579fc"
            type="text"
            append-icon="mdi-content-copy"
            @click:append="copy('0x1c4b2e0d25f2291fae15c8b2069ea7c20ab579fc')"
          >
          </v-text-field>
                            
                    </v-card-subtitle>
                </v-card>
                <v-card class="my-2">
                    <v-card-title>
                        Bitcoin cash <v-icon color="success">mdi-bitcoin</v-icon>
                    </v-card-title>
                    <v-card-subtitle>
                        <v-text-field
                            filled
                            readonly
                            dense
                            value="1MZKd2mBy46HAc7yhhpie31by1oAUB3HNu"
                            type="text"
                            append-icon="mdi-content-copy"
                            @click:append="copy('1MZKd2mBy46HAc7yhhpie31by1oAUB3HNu')"
                        >
                        </v-text-field>
                        
                    </v-card-subtitle>
                </v-card>
                <v-card class="my-2">
                    <v-card-title>
                        USDT:
                    </v-card-title>
                    <v-card-subtitle>
                        <v-text-field
                            filled
                            readonly
                            dense
                            value="0x1c4b2e0d25f2291fae15c8b2069ea7c20ab579fc"
                            type="text"
                            append-icon="mdi-content-copy"
                            @click:append="copy('0x1c4b2e0d25f2291fae15c8b2069ea7c20ab579fc')"
                        >
                        </v-text-field>
                    </v-card-subtitle>
                </v-card>
                <v-card
                class="my-2"
                >
                    <v-card-title>
                        USDC <v-icon color="primary">mdi-currency-usd-circle</v-icon>
                    </v-card-title>
                    <v-card-subtitle>
                        <v-text-field
                            filled
                            readonly
                            dense
                            value="0xbCC49C9ccA5F169afA08f15308a924C74C9ecfE2"
                            type="text"
                            append-icon="mdi-content-copy"
                            @click:append="copy('0xbCC49C9ccA5F169afA08f15308a924C74C9ecfE2')"
                        >
                        </v-text-field>
                    </v-card-subtitle>
                </v-card>


            </v-card-text>
    </div>
    </wrapper>
</template>
<script>
import Wrapper from '..//layouts/default'
export default {
    components: {Wrapper},
    data() {
        return {
            show: false,
        }
    },
    computed: {
    },
    methods: {
        copy(term) {
            try {
                navigator.clipboard.writeText(term);
                this.show = true;
            } catch (e) {
                console.log('error');
            }
        },
    },
    
}
</script>
<style>
.theme--light.v-text-field--filled>.v-input__control>.v-input__slot {
    background: #343a40 !important;
    color: white !important;
}
.theme--light.v-input, .theme--light.v-input input, .theme--light.v-input textarea {
    color: #f1f1f1 !important;
}
.v-icon--link.theme--light.v-icon {
    color: white !important;
}
</style>
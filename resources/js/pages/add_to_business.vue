<template>
<wrapper>
    <div class="vh-100">
        <v-card>
            <h6 class="container">
            To add your internet business to our network, send us an email <a href="mailto:marketwardverifies@gmail.com">@marketwardverifies@gmail.com</a>
            </h6>
            <v-card-text>
                Please ensure to include these details in the email as follows
                <v-list>

                    <v-list-item
                        v-for="(item, key) in items"
                        :key="key"
                    >
                        <v-list-item-content>
                            <v-list-item-title style="white-space: normal;">
                                &#183; {{ item.text }}
                            </v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>                    
                </v-list>
            </v-card-text>
        </v-card>
    </div>
    </wrapper>
</template>
<script>
import Wrapper from '..//layouts/default'
export default {
    components: {Wrapper},
    data() {
        return {
            value: 1,
            items: [
                {
                    text: 'First Indicate in the email if you own the business, or you are a representative of the business (if so, indicate your position), or if you are a customer including a trusted business you know.',
                },
                {
                    text: 'Include all Contact informations of all business platforms. This includes your social media accounts, website, phone number, address (if avaliable), and a contact details of a customer representative for further enquires.',
                },
                {
                    text: 'Tell us the main location(s) of the business and its delivery locations',
                }
            ]
        }
    },
}
</script>
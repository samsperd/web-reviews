<template>
<wrapper>
        <div >
            <v-card class="mt-2">
                <v-card-title class="" v-html="privacy.title">
                    
                </v-card-title>
                <v-card-text v-html="privacy.body">
                    
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
            privacy: '',
        }
    },
    created(){
        this.getPrivacy();
    },
    methods: {
        getPrivacy() {
            axios.get('/api/privacy')
                .then((response)=>{
                    this.privacy = response.data.privacy;
                }).catch(err => {
                    // alert('Please Reload');
                    // location.reload();

                });    

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
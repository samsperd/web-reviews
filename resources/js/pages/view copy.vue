<template>
      <basic>

    <div>
    <v-app-bar
      color="white"
      app
      id="viewers"
    >
    <v-btn
    icon
    @click="goBack"
    >
      <v-icon>
          mdi-chevron-left
      </v-icon>
    </v-btn>
    <v-spacer></v-spacer>
      <v-toolbar-title
      class="h6" style="margin-top: 0.5rem;"
      >{{post.title}}
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn @click.stop="drawer = !drawer" icon><v-icon>mdi-magnify</v-icon></v-btn>
      <v-spacer></v-spacer>
      <span v-if="post.location != null">
                  <v-icon color="success">
                    mdi-navigation
                  </v-icon>        
        {{post.location.location}}
      </span>
    </v-app-bar>
    <v-navigation-drawer
      v-model="drawer"
      app
      temporary
      class="bigtipper"
    >
    <v-app-bar>
      Search
      <v-spacer></v-spacer>
      <v-btn @click.stop="drawer = !drawer" icon><v-icon>mdi-close</v-icon></v-btn>
    </v-app-bar>
    <v-main>
      <search :flower="'mb-0 col-md-12'" />
    </v-main>


    </v-navigation-drawer>

  <v-container>
        <v-main>
  <v-card flat>
  <v-row>
      <v-list-item class="grow">

        <v-list-item-content>
          <v-list-item-title class="font-weight-bold">About {{post.title}}
            <v-icon dark color="success">mdi-checkbox-marked-circle</v-icon>            
<div class="container">
      <v-row
        align="center"
      >
        <v-rating
          :value="post.rate"
          dark
          color="amber"
          dense
          half-increments
          readonly
          size="20"
        ></v-rating>

        <span class="grey--text ml-4">
          4.5 (1)
        </span>
      </v-row>
</div>

          </v-list-item-title>
        </v-list-item-content>

        <v-list-item-avatar color="grey darken-3">
          <v-img
            class="elevation-6"
            alt=""
            :src="'/storage/'+post.image"
          ></v-img>
        </v-list-item-avatar>
      </v-list-item>
    <v-card-text>
      <div class="body-2 text-primary">
        <template v-for="(category, index) in post.category">
          <template v-if="index > 0">
            ,
          </template>
          <a :key="index" :href="'/location/' + post.location.slug +'/category/' + category.slug">{{category.name}}</a>
          <!-- <span :key="index">{{category.name}}</span> -->
        </template>
      </div>

      <div class="subtitle-2" v-text="post.excerpt"></div>
      <!-- <v-chip v-if="post.verified == 1" color="success" class="float-right">Verified</v-chip> -->
    <div>
      <ul class="nav nav-tabs justify-content-end">
        <li class="nav-item">
          <a href="#" class="nav-link active">
            Reviews
          </a>
        </li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active">
          <v-row>
          <v-col sm="12" md="6" lg="4">
            <v-card>
              <v-card-text>
                <b>Foody
                  
                </b>
              <v-rating
                :value="post.rate"
                dark
                small
                color="amber"
                dense
                half-increments
                readonly
                size="20"
              ></v-rating>
              
                An onliine food delivery network situated at gregory university uturu
              </v-card-text>
            </v-card>
          </v-col>
          <v-col sm="12" md="6" lg="4">
            <v-card>
              <v-card-text>
                <b>Foody
                  
                </b>
              <v-rating
                :value="post.rate"
                dark
                small
                color="amber"
                dense
                half-increments
                readonly
                size="20"
              ></v-rating>
              
                An onliine food delivery network situated at gregory university uturu
              </v-card-text>
            </v-card>
          </v-col>
          <v-col sm="12" md="6" lg="4">
            <v-card>
              <v-card-text>
                <b>Foody
                  
                </b>
              <v-rating
                :value="post.rate"
                dark
                small
                color="amber"
                dense
                half-increments
                readonly
                size="20"
              ></v-rating>
              
                An onliine food delivery network situated at gregory university uturu
              </v-card-text>
            </v-card>
          </v-col>
          </v-row>


        </div>

      </div>
    </div>
    </v-card-text>
    
    <v-divider class="mx-4"></v-divider>

    <v-card-text class="h6 font-weight-bold" v-if="deals_with.length > 0">
        Deals with:
              <v-chip-group
        active-class="black white--text"
        column
      >
        <template  v-for="(deals, i) in deals_with">
          <div  :key="i">
        <v-chip>{{deals}}</v-chip>
            
          </div>
        </template>
      </v-chip-group>

    </v-card-text>
</v-row>
  </v-card>
      <!-- Embedded Page  -->
        <v-row>
          <v-col>
        <v-sheet class="bigtippers">

              
              <div class="postbody" v-if="post.body">
                
                <v-card>
                  <v-card-subtitle class="font-italic">
                    Description
                  </v-card-subtitle>
                  <v-card-text v-html="post.body">
                    
                  </v-card-text>
                </v-card>
              </div>
              <div class="instagram" v-if="post.instagram_page">
                <v-card>
                  <v-card-subtitle class="text-black-50">
                    Instagram 
                  </v-card-subtitle>
                    <instagram-embed
                      :url="post.instagram_page"
                    />
                </v-card>
              </div>
              <div class="facebook" v-if="post.facebook_page">
                <hr>
                <v-card>
                  <v-card-subtitle class="text-black-50">
                    Facebook
                  </v-card-subtitle>
                  <div v-html="post.facebook_page">

                  </div>
                </v-card>
              </div>
              <div class="twitter" v-if="post.twitter_page">
                <hr>
                <v-card>
                  <v-card-subtitle class="text-black-50">
                    Twitter
                  </v-card-subtitle>
                  <div v-html="post.twitter_page">

                  </div>

                </v-card>
              </div>

              
            </v-sheet>
          </v-col>
        </v-row>
        <!-- Reach Out -->
        <v-row>
            <v-card
          outlined
          class="col-12 bottom-0"
          flat
        >
            <v-card-title class="h6 font-weight-bold my-0">
              Contact them at
            </v-card-title>
          <!-- References -->
          <v-row>
            <v-card class="col-12" flat>
              <v-card-actions class="col-12 py-0">
              <div class="row row-sm align-items-center">
                <div class="col text-center" v-if="post.link != null">
                  <v-btn rounded class="text-text-decoration-none" target="blank" :href="'https://'+post.link">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z"></path><circle cx="12" cy="12" r="9"></circle><line x1="3.6" y1="9" x2="20.4" y2="9"></line><line x1="3.6" y1="15" x2="20.4" y2="15"></line><path d="M11.5 3a17 17 0 0 0 0 18"></path><path d="M12.5 3a17 17 0 0 1 0 18"></path></svg>
                    Website

                  </v-btn>
                </div>
                <div class="col text-center" v-if="post.instagram != null">
                  <v-btn rounded class="text-text-decoration-none" target="blank" :href="'https://www.instagram.com/'+post.instagram">
                    <v-icon color="pink darken-1">mdi-instagram</v-icon>
                    Instagram

                  </v-btn>
                </div>              
                <div class="col text-center" v-if="post.twitter != null">
                  <v-btn class="text-text-decoration-none" rounded target="blank" :href="'https://www.twitter.com/'+post.twitter">
                    <v-icon color="light-blue lighten-3">mdi-twitter</v-icon>
                    Twitter

                  </v-btn>
                </div>              
                <div class="col text-center" v-if="post.facebook != null">
                  <v-btn rounded class="text-text-decoration-none" target="blank" :href="'https://www.facebook.com/'+post.facebook">
                    <v-icon color="indigo">mdi-facebook</v-icon>
                    Facebook

                  </v-btn>
                </div>              
                <div class="col text-center" v-if="post.whatsapp != null">
                  <v-btn class="text-text-decoration-none" rounded :href="post.whatsapp">
                    <v-icon color="success">mdi-whatsapp</v-icon>
                    WhatsApp

                  </v-btn>
                </div>              


              </div>
                  
                
              </v-card-actions>
            </v-card>

          </v-row>
        <v-divider></v-divider>

            <v-card-actions>
              <v-responsive>
            <v-list
            class="dvvv"
            two-line>
            <template v-if="post.company_number != null">

              <v-list-item :href="'tel:'+post.company_number">
                <v-list-item-icon>
                  <v-icon color="indigo">
                    mdi-phone
                  </v-icon>
                </v-list-item-icon>

                <v-list-item-content>
                  <v-list-item-title v-text="post.company_number"></v-list-item-title>
                  <v-list-item-subtitle>Mobile</v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
              <v-divider inset></v-divider>
            </template>
            <template v-if="post.company_email != null">
              <v-list-item :href="'mailto:'+post.company_email">
                <v-list-item-icon>
                  <v-icon color="indigo">
                    mdi-mail
                  </v-icon>
                </v-list-item-icon>

                <v-list-item-content>
                  <v-list-item-title v-text="post.company_email"></v-list-item-title>
                  <v-list-item-subtitle>Mail</v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>

              <v-divider inset></v-divider>


            </template>
              <template v-if="post.company_address != null">
              <v-list-item target="blank"  :href="'http://maps.google.com/?q='+ post.company_address">
                <v-list-item-icon>
                  <v-icon color="indigo">
                    mdi-map-marker
                  </v-icon>
                </v-list-item-icon>

                <v-list-item-content>
                  <v-list-item-title>{{post.company_address}}</v-list-item-title>
                  <v-list-item-subtitle>Address</v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
              <v-divider inset></v-divider>

              </template>
              <template v-if="post.company_full_name != null">
              <v-list-item>
                <v-list-item-icon>
                  <v-icon color="indigo">
                    mdi-office-building
                  </v-icon>
                </v-list-item-icon>

                <v-list-item-content>
                  <v-list-item-title>{{post.company_full_name}}</v-list-item-title>
                  <v-list-item-subtitle>Business Name</v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
              <v-divider inset></v-divider>
              </template>
              <template v-if="post.owner_of_business != null">
              <v-list-item>
                <v-list-item-icon>
                  <v-icon color="indigo">
                    mdi-account-key
                  </v-icon>
                </v-list-item-icon>

                <v-list-item-content>
                  <v-list-item-title>{{post.owner_of_business}}</v-list-item-title>
                  <v-list-item-subtitle>Founder</v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
              </template>


            </v-list>
              </v-responsive>
            </v-card-actions>
        </v-card>

        </v-row>
        </v-main>

  </v-container>
  <hr>
  <v-container grid-list-xl>
    <h5>Checkout Related businessess</h5>
    <v-row>
      <v-col cols="12" sm="4">
        <v-card>
          <v-card-title primary-title>
            title
          </v-card-title>
        </v-card>
      </v-col>
      <v-col cols="12" sm="4">
        <v-card>
          <v-card-title primary-title>
            title
          </v-card-title>
        </v-card>
      </v-col>
      <v-col cols="12" sm="4">
        <v-card>
          <v-card-title primary-title>
            title
          </v-card-title>
        </v-card>
      </v-col>

    </v-row>

  </v-container>
    </div>
      </basic>
</template>
<script>
import Search from '..//components/Search'
import Basic from '..//layouts/basic'

export default {
    // metaInfo () {
    //   return {
    //     title: 'Find information, contacts, ratings and reviews about ' +this.post.title,
    //     script: [
    //       { src: "//www.instagram.com/embed.js", async: true, defer: true },
    //       {src: "//platform.twitter.com/widgets.js", async: true, charset: "utf-8"}
    //     ],
    //     meta: [
    //       {
    //         name: 'description',
    //         content: this.post.meta_description
    //       },
    //       {
    //         name: 'keywords',
    //         content: this.post.meta_keywords
    //       }
    //     ]
    //   }
    // },    
    props: ['slug'],
    components: {
      Search,
      Basic
    },
    data() {
      return {
        post: '',
        dialog: false,
        rating: 0,
        tab: null,
        deals_with: [],
        drawer: null,
      }
    },
    created() {
      this.getPost();
    },
    methods: {
      getPost() {
        axios.get('/api/post/'+this.slug)
            .then((response)=>{
                this.post = response.data.post;
                
                var deals_get = response.data.post.deals_with;
                var str_array = deals_get.split(',');
                this.deals_with = str_array;
            }).catch(err => {
                // alert('Please Reload');
                // location.reload();

            });    
        
      },
      goBack(){
          window.history.back();
      },


    },
    mounted() {
      var plug = document.createElement("script");
      plug.setAttribute(
        "src", "//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5ec45c28a73184d6"
      );
      plug.type = "text/javascript";
      document.head.appendChild(plug);
    },
}
</script>
<style scoped>
.dvvv{
  overflow-x: scroll !important;
}
.bigtippers{
  overflow-y: scroll !important;
  height: 350px !important;
  border-top: 1px solid rgba(0,0,0,.12);
}
#viewers .v-toolbar__content {
    padding-right: 0 !important;
}
.bigtipper {
  width: 350px !important;
}
@media screen and (max-width: 760px){
  .bigtipper{width: 100vw !important; margin: 0;}
}
</style>
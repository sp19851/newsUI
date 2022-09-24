
const App = {
    
    data() {
        return {
           show: false, 
           title:"",
           author:"",
           mes:"",
        }
    
    },    
    
    components:{},
  

    methods: {
        showingForm(bool) {
           this.show = bool;
          
        },
        onClose() {
            this.show = false;
            $.post('https://newsUI/close');
        },
},
    
    mounted() {
        this.listener = window.addEventListener("message", (event) => {
            console.log('test window.addEventListener', event.data.action)
            if(event.data.action === 'newPOST') {
                this.title = event.data.title;
                this.author = event.data.author;
                this.mes = event.data.mes;
                this.showingForm(true);

            } else if(event.data.action === 'close') {
                this.onClose()
            }
            
        });
        window.document.onkeydown = event => event && event.code === 'Escape' ? this.onClose() : null
       

        
       

      },
    create: {
        

    },
    watch: {
       
    },

    computed: {
    },
}




let app = Vue.createApp(App)
app.mount('#app')

//v-if="item.attached.lenght>0"
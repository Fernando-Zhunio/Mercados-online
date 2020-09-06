import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AuthServiceService } from '../../Servicios/auth-service.service';
import { ToastController } from '@ionic/angular';
import {ERoles} from '../../enums/enums.enum';
import { Router } from '@angular/router';
import { LoadingController } from '@ionic/angular';
import { Session } from '../../Class/session';
import { StorageService } from '../../Servicios/storage.service';

@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.page.html',
  styleUrls: ['./login-page.page.scss'],
})
export class LoginPagePage implements OnInit {

  password:string="";
  email:string="";

  

  formLogin:FormGroup= new FormGroup({
    'usuario': new FormControl(null,[Validators.required]),
    'password': new FormControl(null,[Validators.required])
  });
  isSend:boolean = false;
  constructor(
    private router: Router,
    public loadingController: LoadingController,
    private serviceAuth:AuthServiceService,
    private toastController:ToastController,
    private storageService: StorageService,
    ) { }

  ngOnInit() {
  }

  onSubmit(){
    // console.log("Enviando ...");
    // let loader = this.presen();
    this.showLoading()

    let usuario = this.formLogin.controls['usuario'].value;
    let password = this.formLogin.controls['password'].value;
    this.serviceAuth.login(usuario,password).subscribe((res:any)=>{
      console.log(res);
      this.cancelLoading();
      if(res.token){
        // alert('logiado');
        switch (res.rol) {
          case ERoles.cliente:
            // AuthServiceService.changeToken(res.token);
            this.sessionBuild(res);
            this.router.navigate(['/cliente']);
            break;
          case ERoles.vendedor:
              this.router.navigate(['/vendedor', { id: res.id }]);
            break;  
          case ERoles.trasnportista:
              this.router.navigate(['/transportista', { id: res.id }]);
            break;
          default:
            this.presentToast("Error usuario no especificado");
            break;
        }
      }
      else{
        this.presentToast("Error al iniciar sesion intentelo otra vez");
        alert('no authenticado');
        this.cancelLoading()
      }
    },error=>{
      this.cancelLoading()
      console.log(error)
      this.presentToast("Usuario o contraseña no existe");
    })
  }

  async presentToast(message) {
    const toast = await this.toastController.create({
      message: message,
      duration: 2000
    });
    toast.present();
  }
  loader:HTMLIonLoadingElement
  async showLoading() {
     this.loader = await this.loadingController.create({
      // cssClass: 'my-custom-class',
      spinner: 'crescent',
      // duration: 5000,
      message: 'Cargando ...',
      translucent: true,
      cssClass: 'custom-class custom-loading',
      backdropDismiss: false
    });
    await  this.loader.present();
  }

  cancelLoading(){
    this.loader.dismiss();
  }

  private sessionBuild(data){
    let session = new Session()
    session.token = data.token;
    session.user.id = data.id;
    session.user.email = data.email;
    session.user.apellidos = data.apellidos;
    session.user.nombres = data.nombres;
    session.user.celular = data.celular;
    session.user.direccion = data.direccion;
    session.user.rol = data.rol;
    session.user.imagen = data.imagen;

    session.user.id_puesto = data.id_puesto || null;
    // session.user.direccion = data.direccion;
    this.correctLogin(session);

  }

  private correctLogin(data: Session){
    this.storageService.setCurrentSession(data);   
    // this.router.navigate(['/home']);
  }

}

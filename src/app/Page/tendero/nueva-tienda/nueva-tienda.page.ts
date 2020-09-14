import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Camera } from '@ionic-native/camera/ngx';

@Component({
  selector: 'app-nueva-tienda',
  templateUrl: './nueva-tienda.page.html',
  styleUrls: ['./nueva-tienda.page.scss'],
})
export class NuevaTiendaPage implements OnInit {

  constructor(private camera:Camera) { }
  currentImage: any;
  formRegisterLocal:FormGroup = new FormGroup({
    nombre: new FormControl(null, [Validators.required]),
    telefono: new FormControl(null, [Validators.required]),
    categoria: new FormControl(null, [Validators.required]),
    descripcion: new FormControl(null, [Validators.required]),
  })
  ngOnInit() {
  }

  takePhoto(){
    const options: CameraOptions = {
      quality: 100,
      destinationType: this.camera.DestinationType.DATA_URL,
      encodingType: this.camera.EncodingType.JPEG,
      mediaType: this.camera.MediaType.PICTURE
    }
    this.camera.getPicture(options).then((imageData) => {
      this.currentImage = 'data:image/jpeg;base64,' + imageData;
    }, (err) => {
     // Handle error
     console.log("Camera issue:" + err);
    });
  }
}

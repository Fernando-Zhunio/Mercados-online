import { Component, OnInit } from '@angular/core';
import { User } from '../../Class/user';
import { StorageService } from '../../Servicios/storage.service';
import { environment } from 'src/environments/environment';

// interface IUser{
//   apellidos:string,
//   direccion:string
//   nombres:string,
//   correo:string,
//   celular:number
// }
@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss'],
})

export class ProfileComponent implements OnInit {

  
  constructor(private svcStore:StorageService) { }

  end_point = environment.end_point+'storage/'
  defaultImagen = 'assets/'
  user:User
  ngOnInit() {
    this.user = this.svcStore.getCurrentUser();
  }

  logOut(){
    this.svcStore.logout();

  }

}

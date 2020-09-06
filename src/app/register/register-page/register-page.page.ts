import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AuthServiceService } from '../../Servicios/auth-service.service';

@Component({
  selector: 'app-register-page',
  templateUrl: './register-page.page.html',
  styleUrls: ['./register-page.page.scss'],
})
export class RegisterPagePage implements OnInit {

  

  ngOnInit() {
  }
  password:string="";
  email:string="";

  formRegister:FormGroup= new FormGroup({
    'email': new FormControl(null,[Validators.email, Validators.required]),
    'password': new FormControl(null,[Validators.required])
  })
  constructor(private serviceAuth:AuthServiceService) { }

  

  onSubmit(){
    let email = this.formRegister.controls['email'].value
    let password = this.formRegister.controls['password'].value
    this.serviceAuth.login(email,password).subscribe((res:any)=>{
      if(res.success){
        alert('logiado');
      }
      else{
        alert('no authenticado');
      }
    })
  }

}

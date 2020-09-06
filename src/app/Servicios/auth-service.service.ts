import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthServiceService {

  constructor(private http:HttpClient) { }
  end_point:string = environment.end_point;

  private static token:string;
  static changeToken(token){
    this.token = token;
    console.log('change :', this.token)
  }

  static getToken(){
    console.log('getToken :', this.token)
    return this.token;
  }

  static deleteToken(){
    this.token = null;
  }
  public login(usuario,password){
    // let server = environment.end_point;
    let data ={usuario,password}
    return this.http.post(`${this.end_point}api/auth`,data);
  }

}

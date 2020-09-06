import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { AuthServiceService } from './auth-service.service';
import { Router } from '@angular/router';
import { StorageService } from './storage.service';

@Injectable({
  providedIn: 'root'
})
export class ClientesService {

  end_point = environment.end_point;
  constructor(private http:HttpClient,private storageSvc:StorageService) { }

  getMercados(page){ 
   let token = this.storageSvc.getCurrentSession().token;
   return this.http.get(`${this.end_point}api/mercados`,
    {headers:{'Authorization':`Bearer ${token}`}})
  }

  getMercado(id){
    let token = this.storageSvc.getCurrentSession().token;
   return this.http.get(`${this.end_point}api/mercado-detalle/${id}`,
    {headers:{'Authorization':`Bearer ${token}`}})
  }

  getPuesto(id){
    const token = this.storageSvc.getCurrentSession().token;
    return this.http.get(`${this.end_point}api/puesto-detalle/${id}`,{
      params:{childs:'yes'},
      headers:{'Authorization':`Bearer ${token}`}
    })
  }
}

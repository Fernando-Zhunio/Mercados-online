import { Component, OnInit } from '@angular/core';
import { ClientesService } from '../../Servicios/clientes.service';
import { environment } from '../../../environments/environment';

interface mercado{
  nombre:string,
  direccion:string,
  ciudad:string,
  url_imagen:string,
  descripcion:string,
  id:number
 }
@Component({
  selector: 'app-mercado',
  templateUrl: './mercado.component.html',
  styleUrls: ['./mercado.component.scss'],
})
export class MercadoComponent implements OnInit {

  constructor(private svcCliente:ClientesService) { }
  end_point = environment.end_point+'storage/';
  page:number=1;
  mercados:Array<mercado>=[];
  ngOnInit() {
    this.getMercados(this.page);
  }

  loadData(event):void{
    this.page++;
    // this.getMercados(this.page,event);
  }

  getMercados(page):void{
    console.log('cargando');  
    this.svcCliente.getMercados(page).subscribe((res:any)=>{
      console.log(res);
      // if(res.length ==0 && event != null){
        // event.complete();
      // }
      this.mercados = res;
    },error=>{console.log(error);
    })
  }

  newData(event){
    this.svcCliente.getMercados(1).subscribe((res:any)=>{
      console.log(res);
      // if(res.length ==0 && event != null){
        // event.complete();
      // }
      event.target.complete();
      this.mercados = res;
    },error=>{
      console.log(error);
      event.target.complete();
    })
  }
  goDetalle(id){
    
  }


}

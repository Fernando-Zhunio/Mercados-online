import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { CarritoDetalleModalComponent } from './carrito-detalle-modal.component';

describe('CarritoDetalleModalComponent', () => {
  let component: CarritoDetalleModalComponent;
  let fixture: ComponentFixture<CarritoDetalleModalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CarritoDetalleModalComponent ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(CarritoDetalleModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

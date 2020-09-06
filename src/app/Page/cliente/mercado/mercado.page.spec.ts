import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { MercadoPage } from './mercado.page';

describe('MercadoPage', () => {
  let component: MercadoPage;
  let fixture: ComponentFixture<MercadoPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MercadoPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(MercadoPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

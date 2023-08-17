import { Injectable } from "@angular/core";
import { IProduct } from "../Iproduct";
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from "rxjs";
import { catchError, tap } from "rxjs/operators";

@Injectable({
    providedIn: 'root'
})
export class ProductService{
    private productUrl = "https://nu5m6h3hji.us-east-1.awsapprunner.com/products"///'api/products/';

    constructor(private http: HttpClient){ }

    getProducts(): Observable<IProduct[]>{        
        return this.http.get<IProduct[]>(this.productUrl).pipe(
            tap(data=> console.log('All: ' + JSON.stringify(data))), 
            catchError(this.handleError)
        );
    }

    private handleError(err: HttpErrorResponse){
        let errorMessage = '';
        if (err.error instanceof ErrorEvent){
            errorMessage = `An error occurred: ${err.error.message}`;
        }else{
            errorMessage = `Server returned code: ${err.status}, error message is: ${err.message}`;
        }
        console.log(errorMessage);
        return throwError(errorMessage);
    }
}
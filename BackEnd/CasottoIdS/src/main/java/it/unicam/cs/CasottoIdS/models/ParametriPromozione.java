package it.unicam.cs.CasottoIdS.models;

public class ParametriPromozione {

    public String idProdotto;
    public double newPrezzo;

    public ParametriPromozione(String idProdotto,double newPrezzo) {
        this.idProdotto = idProdotto;
        this.newPrezzo = newPrezzo;
    }

    public String getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(String idProdotto) {
        this.idProdotto = idProdotto;
    }


    public double getNewPrezzo() {
        return newPrezzo;
    }

    public void setNewPrezzo(double newPrezzo) {
        this.newPrezzo = newPrezzo;
    }
}

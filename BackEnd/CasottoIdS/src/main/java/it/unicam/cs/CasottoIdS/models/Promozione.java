package it.unicam.cs.CasottoIdS.models;

import org.springframework.data.annotation.Id;

public class Promozione {

    @Id
    public String idPromozione;
    private String idProdotto;
    private double originalPrezzo;
    private double newPrezzo;

    public Promozione(String idProdotto, double originalPrezzo, double newPrezzo) {
        this.idProdotto = idProdotto;
        this.originalPrezzo = originalPrezzo;
        this.newPrezzo = newPrezzo;
    }

    public String getIdPromozione() {
        return idPromozione;
    }

   public String getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(String idProdotto) {
        this.idProdotto = idProdotto;
    }

    public double getOriginalPrezzo() {
        return originalPrezzo;
    }

    public void setOriginalPrezzo(double originalPrezzo) {
        this.originalPrezzo = originalPrezzo;
    }

    public double getNewPrezzo() {
        return newPrezzo;
    }

    public void setNewPrezzo(double newPrezzo) {
        this.newPrezzo = newPrezzo;
    }
}

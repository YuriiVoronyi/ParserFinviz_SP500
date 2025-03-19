package com.finviz.tests;

import com.finviz.pages.IndexSP500_Page;
import com.finviz.pages.ScreenerPage;
import org.testng.annotations.Test;

public class StartParsingSP500 extends TestBase {

    private int timeOfPause = 15000;

    @Test
    public void make_Start() {

        ScreenerPage screenerPage = new ScreenerPage(driver);
        screenerPage.openIndexMenu();
        pause(1000);
        screenerPage.choiceIndexSP500();
        pause(1000);

        //После выбора индекса SP500 получаем страницу с компаниями входящими в этот индекс
        IndexSP500_Page indexSP500_page = new IndexSP500_Page(driver);
        indexSP500_page.loadingDataByCompany();

        System.out.println("Финиш");
    }
}

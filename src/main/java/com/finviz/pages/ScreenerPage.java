package com.finviz.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.support.ui.Select;

import java.time.Duration;

public class ScreenerPage extends BasePage {

    @FindBy(id = "fs_idx")
    private WebElement openMenuOfIndex;

    @FindBy(xpath = "//*[@id='qc-cmp2-ui']/div[2]/div/button[2]/span")
    WebElement button_disagree;

    public ScreenerPage(WebDriver driver) {

        super(driver);
        PageFactory.initElements(driver, this);// Инициализация полей с аннотацией @FindBy
        // Установка максимального времени ожидания в 60 секунд
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("fs_idx")));// Ожидание видимости элемента

        wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id='qc-cmp2-ui']/div[2]/div/button[2]/span")));// Ожидание видимости элемента
    }

    public ScreenerPage closeWindowOfAdvertising() { // Закрываем окно рекламы
        button_disagree.click();
        return this;
    }

    public ScreenerPage openIndexMenu() {
        openMenuOfIndex.click();
        return this;
    }

    public IndexSP500_Page choiceIndexSP500() {

        // Создаем объект Select для работы с выпадающим списком
        Select dropdown = new Select(openMenuOfIndex);

        // Выбираем второй элемент по индексу (индексация с нуля)
        dropdown.selectByIndex(1);

        return new IndexSP500_Page(driver);
    }

}

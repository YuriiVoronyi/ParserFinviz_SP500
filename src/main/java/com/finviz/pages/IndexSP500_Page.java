package com.finviz.pages;

import com.finviz.repositories.AppRepository;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.time.Duration;
import java.time.LocalTime;
import java.util.List;

public class IndexSP500_Page extends BasePage {

    public IndexSP500_Page(WebDriver driver) {
        super(driver);
    }

    AppRepository appRepository = new AppRepository();

    // Установка максимального времени ожидания в 60 секунд
    WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));

    LocalTime currentTime;

    @FindBy(xpath = "//*[@id='screener-table']/td/table/tbody/tr/td/table")
    WebElement table_light;

    public IndexSP500_Page loadingDataByCompany() {

        String baseUrl = "https://finviz.com/screener.ashx?v=111&f=idx_sp500&r="; // Базовый URL
        int companiesPerPage = 20; // Количество компаний на странице
        int startRow = 1; // Номер строки для первой страницы
        int numberOfPage = 1; // Номер страницы пагинации

        String nameOfTable = "cme_sp500";

        WebElement nextElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id='screener-table']/td/table/tbody/tr/td/table")));

        try (Connection connection = appRepository.getConnection()) {
            // Очистка таблицы перед началом
            String deleteQuery = "DELETE FROM " + nameOfTable;
            connection.prepareStatement(deleteQuery).executeUpdate();

            String resetQuery = "ALTER TABLE " + nameOfTable + " AUTO_INCREMENT = 1";
            connection.prepareStatement(resetQuery).executeUpdate();

            String query = "INSERT INTO " + nameOfTable + " (id, tiker, name, sector, industry, market_cap, percentage_change, volume, time_of_loading) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // Создание PreparedStatement один раз
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                while (true) {
                    // Формирование URL для текущей страницы
                    String url = baseUrl + startRow;
                    driver.get(url);

                    if (table_light != null) {

                        // Находим все строки в таблице
                        List<WebElement> rows = table_light.findElements(By.tagName("tr"));
//                        if (rows.isEmpty() || rows.size() <= 1) break; // Если данных нет, завершаем цикл

                        // Проходимся по каждой строке данных и добавляем их в таблицу базы данных.
                        for (int i = 1; i < rows.size(); i++) {
                            // Получаем текстовое содержимое ячеек в строке
                            List<WebElement> cells = rows.get(i).findElements(By.tagName("td"));
                            try {
                                // Получаем значения из каждой ячейки и добавляем их в запрос batch insert
                                statement.setInt(1, 0);  // Устанавливаем значение из столбца "id"

                                String tiker = cells.get(1).getText().trim(); // Удаляем пробелы в начале и конце

                                statement.setString(2, tiker); // Устанавливаем значение из столбца "ticker"

                                String name = cells.get(2).getText().trim(); // Удаляем пробелы в начале и конце
                                statement.setString(3, name); // Устанавливаем значение из столбца "company"

                                String sector = cells.get(3).getText().trim(); // Удаляем пробелы в начале и конце
                                statement.setString(4, sector); // Устанавливаем значение из столбца "Sector"

                                String industry = cells.get(4).getText().trim(); // Удаляем пробелы в начале и конце
                                statement.setString(5, industry); // Устанавливаем значение из столбца "Industry"

//                                double tmp_res = Double.parseDouble(cells.get(6).getText().trim().replace("B", ""));
//                                // Умножаем на 1 миллиард (10^9), чтобы получить итоговое значение
//                                double marketcap = tmp_res * 1_000_000_000;
//                                statement.setDouble(6, marketcap); // Устанавливаем значение из столбца "market cap"
//
//                                double change = Double.parseDouble(cells.get(9).getText().trim().replace("%", "").replace(",", "."));
//                                statement.setDouble(7, change); // Устанавливаем значение из столбца "change"

                                float tmp_res = Float.parseFloat(cells.get(6).getText().trim().replace("B", ""));
                                // Умножаем на 1 миллиард (10^9), чтобы получить итоговое значение
                                float marketcap = tmp_res * 1_000_000_000;
                                statement.setDouble(6, marketcap); // Устанавливаем значение из столбца "market cap"

                                float change = Float.parseFloat(cells.get(9).getText().trim().replace("%", "").replace(",", "."));
                                statement.setDouble(7, change); // Устанавливаем значение из столбца "change"

                                int volume = Integer.parseInt(cells.get(10).getText().trim().replace(",", ""));
                                statement.setInt(8, volume); // Устанавливаем значение из столбца "volume"

                                currentTime = LocalTime.now().withNano(0); // Время без миллисекунд
                                statement.setTime(9, Time.valueOf(currentTime)); // Устанавливаем значение времени загрузки равное текущему времени

                                statement.addBatch();
                            } catch (Exception e) {
                                System.out.println("Ошибка обработки строки: " + e.getMessage());
                            }
                        }
                        // Выполняем пакетную вставку
                        statement.executeBatch();

                        System.out.println("Завершена загрузка компаний индекса SP&500 страницы № " + numberOfPage + ", время данных: " + currentTime);

                        // Переходим к следующей странице
                        startRow += companiesPerPage;
                        numberOfPage += 1;
                    }

                    if (501 < startRow) {
                        break; // Завершаем цикл
                    }

                }
                System.out.println("=======================================================");
                System.out.println("Загрузка всех компаний индекса SP&500 завершена! Время данных: " + currentTime);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return this;
    }
}

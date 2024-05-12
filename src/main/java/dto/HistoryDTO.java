package dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@ToString
public class HistoryDTO {
    private int id;
    private double lat;
    private double lnt;
    private String regDt;
}

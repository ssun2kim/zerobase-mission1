package dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@ToString
public class BookmarkGroupDTO {
    private int id;
    private String name;
    private int orderVal;
    private String regDt;
    private String updDt;
}

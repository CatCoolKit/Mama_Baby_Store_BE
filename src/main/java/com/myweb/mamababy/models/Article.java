package com.myweb.mamababy.models;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "articles")
@Data//toString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Article {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "header", nullable = false)
    private String header;

    @Column(name = "content")
    private String content;

    @Column(name = "product_recom")
    private int product_recom;

    @Column(name = "link_image")
    private String link_image;

    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;

    @Column(name = "created_at ")
    private LocalDateTime  created_at;

    @Column(name = "updated_at ")
    private LocalDateTime updated_at;

    @Column(name = "status")
    private Boolean status;

}

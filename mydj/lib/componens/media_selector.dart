import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Enum untuk menentukan apakah media berupa foto atau video
enum MediaType {
  photo,
  video,
}

class MediaSelector extends StatefulWidget {
  final MediaType mediaType;
  const MediaSelector({super.key, this.mediaType = MediaType.photo});

  @override
  State<MediaSelector> createState() => _MediaSelectorState();
}

class _MediaSelectorState extends State<MediaSelector> {
  String _mediaPath = ''; // Menyimpan path file media

  // Fungsi untuk mengambil media dari kamera atau galeri
  Future<XFile?> _retrieveMedia(ImageSource source) async {
    final picker = ImagePicker();
    XFile? media;

    if (widget.mediaType == MediaType.photo) {
      media = await picker.pickImage(source: source);
    } else {
      media = await picker.pickVideo(source: source);
    }
    return media;
  }

  // Memilih media dari kamera
  void _selectFromCamera() async {
    XFile? media = await _retrieveMedia(ImageSource.camera);
    if (media != null) {
      setState(() {
        _mediaPath = media.path;
      });
    }
  }

  // Memilih media dari galeri
  void _selectFromGallery() async {
    XFile? media = await _retrieveMedia(ImageSource.gallery);
    if (media != null) {
      setState(() {
        _mediaPath = media.path;
      });
    }
  }

  // Menghapus media yang dipilih
  void _deleteSelected() {
    setState(() {
      _mediaPath = '';
    });
  }

  // Placeholder tampilan media
  Widget _mediaPlaceholder() {
    Icon icon;
    String caption = '';
    Widget placeholderWidget;

    if (widget.mediaType == MediaType.photo) {
      icon = const Icon(Icons.image_not_supported, color: Colors.grey);
      caption = 'No photo';
      placeholderWidget = Image.file(
        File(_mediaPath),
        width: double.infinity,
        fit: BoxFit.fitWidth,
      );
    } else {
      icon = const Icon(Icons.videocam_off, color: Colors.grey);
      caption = 'No video';
      placeholderWidget = Column(
        children: [
          const Icon(Icons.videocam, size: 50, color: Colors.grey),
          Text(
            "Video: ${_mediaPath.split('/').last}",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      );
    }

    // Jika belum ada media
    if (_mediaPath.isEmpty) {
      return SizedBox(
        height: 56,
        child: Row(
          children: [
            icon,
            const SizedBox(width: 8),
            Text(caption),
          ],
        ),
      );
    } else {
      return SizedBox(
        width: double.infinity,
        child: placeholderWidget,
      );
    }
  }

  // Build UI tampilan utama
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              // Placeholder media (foto/video)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _mediaPlaceholder(),
              ),

              // Tombol aksi (kamera, galeri, hapus)
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                color: Colors.blue[50],
                child: Row(
                  children: [
                    // Tombol kamera
                    Expanded(
                      child: FilledButton(
                        onPressed: _selectFromCamera,
                        child: const Icon(Icons.photo_camera),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Tombol galeri
                    Expanded(
                      child: FilledButton(
                        onPressed: _selectFromGallery,
                        child: const Icon(Icons.photo_library),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Tombol hapus
                    Expanded(
                      child: FilledButton(
                        onPressed: _deleteSelected,
                        child: const Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
